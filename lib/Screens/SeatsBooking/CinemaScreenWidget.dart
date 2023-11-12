import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/SeatsBooking/CinemaScreen.dart';
import 'package:poppinroadcimema/Screens/SeatsBooking/DateHoure.dart';

class CinemaScreenWidget extends StatelessWidget {
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
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   right: 0,
              //   child: Center(
              //     child: Text(
              //       'Screen here',
              //     ),
              //   ),
              // ),
            ],
          ),
          DateHourWidget()
        ],
      ),
    );
    ;
  }
}
