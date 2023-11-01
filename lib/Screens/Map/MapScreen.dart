import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/Map/Map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: MapWidget(),
    );
  }
}
