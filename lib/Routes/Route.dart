import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/home_page.dart';
import 'package:poppinroadcimema/Screens/Splash.dart';


import '../Screens/HomePage/home_cinema.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => Splash(),
  '/home': (context) => homescreen(),
  '/cinema': (context) =>  HomeCinema() ,
};
