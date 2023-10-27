import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:poppinroadcimema/Constants.dart';
import 'package:poppinroadcimema/Models/MapMarker.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
      appBar: AppBar(
        title: const Text("Map "),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
      ),
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
                  for (int i = 0; i < mapMarkers.length; i++)
                    Marker(
                        height: 40,
                        width: 40,
                        point:
                            mapMarkers[i].location ?? AppConstants.myLocation,
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
                        })
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: pageController, // Provide the controller
              onPageChanged: (value) {},
              itemCount: mapMarkers.length,
              itemBuilder: (_, index) {
                final item = mapMarkers[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: item.rating,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Expanded(
                                      child: Text(
                                        item.address ?? '',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item.image ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
