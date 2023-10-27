import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/Splash.dart';
import 'package:poppinroadcimema/Screens/home_page.dart';


import '../Screens/home_cinema.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => Splash(),
  '/home': (context) => homescreen(),
  '/cinema': (context) =>  HomeCinema() ,
};
