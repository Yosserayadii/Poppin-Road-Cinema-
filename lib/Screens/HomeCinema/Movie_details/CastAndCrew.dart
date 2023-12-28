import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/MovieActor.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Movie_details/Cast_card.dart';

class CastAndCrew extends StatelessWidget {
  const CastAndCrew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast & Crew",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  MovieActor.listCasts.length, // Use the correct variable name
              itemBuilder: (context, index) => Cast_card(
                  cast: MovieActor.listCasts[
                      index]), // Correct the variable name and use CastCard
            ),
          )
        ],
      ),
    );
  }
}
