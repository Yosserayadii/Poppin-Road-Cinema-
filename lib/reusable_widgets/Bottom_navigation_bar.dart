import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/genres.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/home_page.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/movie_interface.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:poppinroadcimema/Screens/Map/Map.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({Key? key}) : super(key: key);

  @override
  _BottomNavigationbarState createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  int _selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          if (_selectedIndex == 0) Movie_interface(),
          if (_selectedIndex == 1) Movie_interface(),
          if (_selectedIndex == 2) Map(),
          if (_selectedIndex == 3) Movie_interface(),
        ],
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromARGB(69, 23, 27, 48),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
            onPressed: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
          ),
          GButton(
            icon: Icons.verified_user,
            text: 'Profile',
            onPressed: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
            onPressed: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
          ),
          GButton(
            icon: Icons.chat_bubble_outline,
            text: 'ChatBot',
            onPressed: () {
              setState(() {
                _selectedIndex = 3;
              });
            },
          ),
        ],
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
