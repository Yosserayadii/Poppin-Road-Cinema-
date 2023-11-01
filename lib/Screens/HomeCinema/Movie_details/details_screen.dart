import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';

import 'package:poppinroadcimema/Screens/HomeCinema/Movie_details/TitleAndDuration.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Movie_details/backdrop_rating.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Movie_details/body_details.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_button.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class details_Screen extends StatelessWidget {
  late Movie movie;

  details_Screen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          BackdropAndRating(size: size, movie: movie),
          SizedBox(height: 5),
          TitleAndDuration(movie: movie),
          Expanded(
            child: body_details(movie: movie),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 50,
              child: Center(
                child: CustomButton(
                  title: "Get Ticket",
                  color: CustomColors.fifthColor,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
