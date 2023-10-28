import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/HomePage/just_for_you.dart';
import 'package:poppinroadcimema/Screens/HomePage/top_films_now.dart';
import 'package:poppinroadcimema/Screens/HomePage/top_rated_cinema.dart';

class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[TopReatedCinma() , JustForYou() , TopFilms() ],
    ));
  }
}
