import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Category_list.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/genre_card.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/genres.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/movie_carousel.dart';
import 'package:poppinroadcimema/Screens/moviecard.dart';
import 'package:poppinroadcimema/reusable_widgets/Bottom_navigation_bar.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class JustForYou extends StatelessWidget {
  const JustForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
          child: Text(
            'Just For  !',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: SweepGradient(
              colors: [
                CustomColors.fifthColor,
                Color.fromARGB(255, 24, 41, 86)
              ],
              stops: [0.10, 0.85],
              center: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.height / 10,
                  height: MediaQuery.of(context).size.height / 10,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  /*    child: Lottie.asset(
                          'assets/promtion.json',
                          width: 50,
                          repeat: true,
                          fit: BoxFit.cover,
                          reverse: true,
                        ),*/
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Claim 3 free tickets !",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Open a Premium account and get 3 Tickets instantly",
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
