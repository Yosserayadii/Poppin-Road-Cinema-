import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Movie_details/Cast_card.dart';

class CastAndCrew extends StatelessWidget {
  final List casts;
  const CastAndCrew({super.key, required this.casts});

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
                itemCount: casts.length,
                itemBuilder: (context, index) => Cast_card(cast: casts[index])),
          )
        ],
      ),
    );
  }
}
