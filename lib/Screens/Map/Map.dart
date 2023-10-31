import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:poppinroadcimema/Constants.dart';
import 'package:poppinroadcimema/Models/Cinema.dart';
import 'package:poppinroadcimema/Screens/Map/MapBottomWidget.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final PageController pageController = PageController();
  int selectedIndex = 0;
  late LatLng currentLocation;

  late MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    _updateCurrentLocation();
  }

  Future<void> _updateCurrentLocation() async {
    LocationData? locationData;
    var location = Location();

    try {
      locationData = await location.getLocation();
    } catch (e) {
      print("Error getting location: $e");
      // Handle error, show a message to the user, etc.
      return;
    }

    setState(() {
      currentLocation =
          LatLng(locationData!.latitude!, locationData.longitude!);
    });

    // Check if mapController is not null before animating the camera
    mapController.move(currentLocation, 13.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: currentLocation,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/charlie447/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
                additionalOptions: const {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              MarkerLayer(
                markers: [
                  // Marker for the current location
                  Marker(
                    height: 50,
                    width: 50,
                    point: currentLocation,
                    builder: (_) {
                      return SvgPicture.asset("current_location_marker.svg");
                    },
                  ),
                  // Markers for other locations
                  for (int i = 0; i < Cinemas.length; i++)
                    Marker(
                      height: 40,
                      width: 40,
                      point: Cinemas[i].location ?? AppConstants.myLocation,
                      builder: (_) {
                        return GestureDetector(
                          onTap: () {
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
                              child: SvgPicture.asset(
                                'assets/map_marker.svg',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
          MapBottomWidget(pageController: pageController, Cinemas: Cinemas),
        ],
      ),
    );
  }
}
