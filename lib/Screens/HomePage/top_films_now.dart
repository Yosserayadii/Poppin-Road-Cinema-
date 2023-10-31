import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';

import 'package:poppinroadcimema/reusable_widgets/Bottom_navigation_bar.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class TopFilms extends StatelessWidget {
  const TopFilms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
          child: Text(
            'Populer Now !',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      GridView.count(shrinkWrap: true, crossAxisCount: 2, children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Color.fromARGB(158, 15, 30, 91).withOpacity(0.73),
                    BlendMode.dstATop),
                image: AssetImage("assets/barbi.jpg"),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                    color:
                        const Color.fromARGB(197, 50, 50, 68).withOpacity(0.5),
                    spreadRadius: -1,
                    blurRadius: 10,
                    offset: const Offset(5, 5) // changes position of shadow
                    ),
              ]),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 45,
                  height: 30,
                  decoration: BoxDecoration(
                    color: CustomColors.fourthColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "20/10",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: CustomColors.fifthColor),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Barbie ",
                    style: TextStyle(
                        fontSize: 20, color: CustomColors.fourthColor),
                  ),
                  Text(
                    "Barbie ",
                    style: TextStyle(
                        fontSize: 20, color: CustomColors.fourthColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    ]);
  }
}
