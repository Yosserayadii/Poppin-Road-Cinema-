import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/Movie_interface.dart';

import 'package:poppinroadcimema/Screens/HomePage/home_cinema.dart';
import 'package:poppinroadcimema/Screens/Map/Map.dart';
import 'package:poppinroadcimema/Screens/chatbot/chat_screen1.dart';

import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeCinema(),
    MapWidget(),
    //Movie_interface(),
    chatHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: CustomColors.primaryColor,
        color: Color.fromRGBO(49, 54, 77, 0.486),
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Icon(
            FeatherIcons.home,
            color: CustomColors.textColor,
          ),
          Icon(
            FeatherIcons.map,
            color: CustomColors.textColor,
          ),
          Icon(
            FeatherIcons.film,
            color: CustomColors.textColor,
          ),
        ],
      ),
    );
  }
}
