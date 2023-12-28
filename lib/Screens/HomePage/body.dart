import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/HomePage/just_for_you.dart';
import 'package:poppinroadcimema/Screens/HomePage/movie_card.dart';
import 'package:poppinroadcimema/Screens/HomePage/movie_card_container.dart';
import 'package:poppinroadcimema/Screens/HomePage/top_films_now.dart';
import 'package:poppinroadcimema/Screens/HomePage/top_rated_cinema.dart';
import 'package:poppinroadcimema/Screens/Map/MapBottomWidget.dart';

import '../../Models/Cinema.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[TopRatedCinema(), JustForYou(), TopFilms()],
    ));
  }
}
