import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:poppinroadcimema/Constants.dart';
import 'package:poppinroadcimema/Models/Cinema.dart';
import 'package:poppinroadcimema/Screens/Map/MapBottomWidget.dart';
import 'package:permission_handler/permission_handler.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final PageController pageController = PageController();
  int selectedIndex = 0;
  LatLng? currentLocation;
  bool isLoading = true;

  late MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    // Initialize the map and start updating location periodically
    _updateCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _requestLocationPermission() async {
    // Request location permission and handle the response
    var status = await Permission.location.request();
    if (status.isGranted) {
      await _updateCurrentLocation();
    } else {
      // If permission is denied, show a dialog to request it again
      _showPermissionRequestDialog();
    }
  }

  Future<void> _updateCurrentLocation() async {
    // Set loading to true while fetching the current location
    setState(() {
      isLoading = true;
    });

    LocationData? locationData;
    var location = Location();

    try {
      // Get the current location using the location package
      locationData = await location.getLocation();
    } catch (e) {
      print("Error getting location: $e");
      return;
    }

    setState(() {
      // Update the current location and set loading to false
      currentLocation =
          LatLng(locationData!.latitude!, locationData.longitude!);
      isLoading = false;
    });

    if (mapController != null) {
      // Move the map to the updated current location
      mapController.move(currentLocation!, 13.0);
    }
  }

  void _showPermissionRequestDialog() {
    // Show a dialog to request location permission
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Location Permission Required"),
        content: Text("Please grant permission to access your location."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              // Dismiss the dialog and request location permission again
              Navigator.of(context).pop();
              await _requestLocationPermission();
            },
            child: Text("Open Settings"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map widget using FlutterMap package
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              // Center the map at the current location or a default location if still loading
              center:
                  isLoading ? LatLng(36.8978248, 10.1875123) : currentLocation!,
            ),
            mapController: mapController,
            children: [
              // Tile layer for the map using Mapbox tiles
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/charlie447/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
                additionalOptions: const {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              // Marker layer for displaying markers on the map
              MarkerLayer(
                markers: [
                  // Marker for the current location
                  Marker(
                    height: 50,
                    width: 50,
                    point: isLoading ? LatLng(0.0, 0.0) : currentLocation!,
                    builder: (_) {
                      return SvgPicture.asset(
                          "assets/current_location_marker.svg");
                    },
                  ),
                  // Markers for cinema locations
                  for (int i = 0; i < Cinemas.length; i++)
                    Marker(
                      height: 40,
                      width: 40,
                      point: Cinemas[i].location ?? AppConstants.myLocation,
                      builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            // Animate to the selected cinema when tapped
                            pageController.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            selectedIndex = i;
                            setState(() {});
                          },
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 500),
                            scale: selectedIndex == i ? 1 : 0.7,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: selectedIndex == i ? 1 : 0.5,
                              child: SvgPicture.asset('assets/map_marker.svg'),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
          // Loading indicator if still fetching the location
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
          // Widget at the bottom of the screen for additional functionality
          MapBottomWidget(pageController: pageController, Cinemas: Cinemas),
        ],
      ),
    );
  }
}
