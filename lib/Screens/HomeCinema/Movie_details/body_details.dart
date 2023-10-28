import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/genre_card.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/genres.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Movie_details/CastAndCrew.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Movie_details/Details_genre.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Movie_details/TitleAndDuration.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Movie_details/backdrop_rating.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_button.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class body_details extends StatelessWidget {
  final Movie movie;
  const body_details({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      BackdropAndRating(size: size, movie: movie),
      SizedBox(
        height: 5,
      ),
      TitleAndDuration(movie: movie),
      Details_genre(movie: movie),
      Padding(
         padding: EdgeInsets.only(left: 15),
        child: Container(
        alignment: Alignment.topLeft,
        
          child: Text(
            "Plot Summary",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(movie.plot),
      ),
      CastAndCrew(casts:movie.cast),
       SizedBox(
        height: 5,
      ),
      Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          height: 50,
        child: Center(child: 
        CustomButton(title: "Get Ticket", color: CustomColors.fifthColor, onPressed: (){})
        ),
        ),
      )
    ]);
  }
}
