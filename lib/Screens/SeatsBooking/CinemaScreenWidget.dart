import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/SeatsBooking/CinemaScreen.dart';
import 'package:poppinroadcimema/Screens/SeatsBooking/DateHoure.dart';
import 'package:poppinroadcimema/Screens/SeatsBooking/SeatsScreen.dart';

class CinemaScreenWidget extends StatelessWidget {
  final Movie movie;
  CinemaScreenWidget({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 320 / 41,
                child: CustomPaint(
                  painter: CinemaScreenPainter(),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Screen here',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SeatsScreen(movie: movie),
          SizedBox(
            height: 10,
          ),
          DateHourWidget(movie: movie)
        ],
      ),
    );
    ;
  }
}
