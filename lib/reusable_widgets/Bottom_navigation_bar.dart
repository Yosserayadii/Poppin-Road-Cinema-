import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/genres.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/home_page.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:poppinroadcimema/Screens/Map/Map.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({Key? key}) : super(key: key);

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromARGB(69, 23, 27, 48),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
            onPressed: () {
            
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => homescreen(),
                ),
              );
            },
          ),
          GButton(
            icon: Icons.verified_user,
            text: 'Profile',
            onPressed: () {
             
            },
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
            onPressed: () {
            
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Map(),
                ),
              );
            },
          ),
          GButton(
            icon: Icons.chat_bubble_outline,
            text: 'ChatBot',
            onPressed: () {
             
            },
          ),
        ],
      ),
    );
  }
}
