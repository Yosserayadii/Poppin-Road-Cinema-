import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/SeatsBooking/CinemaScreenWidget.dart';

class SeatsBooking extends StatelessWidget {
  final Movie movie;
  const SeatsBooking({super.key, required this.movie});

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
      body: CinemaScreenWidget(movie: movie),
    );
  }
}
