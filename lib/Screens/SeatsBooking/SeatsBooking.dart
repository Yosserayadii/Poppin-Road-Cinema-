import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/SeatsBooking/CinemaScreenWidget.dart';

class SeatsBooking extends StatelessWidget {
  const SeatsBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seats Booking "),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
      ),
      body: CinemaScreenWidget(),
    );
  }
}
