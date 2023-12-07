import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/home_page.dart';
import 'package:poppinroadcimema/Screens/SeatsBooking/SeatsBooking.dart';
import 'package:poppinroadcimema/animations/splash.dart';

import '../Screens/HomePage/home_cinema.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => Splash(),
  '/home': (context) => homescreen(),
  '/cinema': (context) => HomeCinema(),
  '/booking': (context) {
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return SeatsBooking(movie: movie);
  },
};
