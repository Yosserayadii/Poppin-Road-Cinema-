import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/Splash.dart';
import 'package:poppinroadcimema/Screens/home_page.dart';


final Map<String, WidgetBuilder> routes = {
  '/': (context) => Splash(),
  '/home': (context) => homescreen(),
};
