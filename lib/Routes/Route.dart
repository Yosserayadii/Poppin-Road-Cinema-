import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/home_page.dart';
import 'package:poppinroadcimema/Screens/splash.dart';

import '../Screens/home_cinema.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => Splash(),
  '/home': (context) => homescreen(),
  '/cinema': (context) =>  HomeCinema() ,
};
