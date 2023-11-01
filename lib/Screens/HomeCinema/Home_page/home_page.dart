import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/Movie_interface.dart';
import 'package:poppinroadcimema/Screens/HomePage/home_cinema.dart';
import 'package:poppinroadcimema/reusable_widgets/Bottom_navigation_bar.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:poppinroadcimema/Screens/Map/MapScreen.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Movie_interface(),
    MapScreen(),
    HomeCinema(),
    // Add more screens for other tabs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
       backgroundColor: CustomColors.primaryColor,
       color: Color.fromARGB(103, 104, 117, 143),
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Icon(Icons.home),
          Icon(Icons.map),
          Icon(Icons.movie),
     
        ],
      ),
    );
  }
}
