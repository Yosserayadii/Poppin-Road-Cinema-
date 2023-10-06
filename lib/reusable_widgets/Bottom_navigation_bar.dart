import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
class Bottom_navigation_bar extends StatefulWidget {
  const Bottom_navigation_bar({super.key});
  
  @override
  State<Bottom_navigation_bar> createState() => _Bottom_navigation_barState();
}

class _Bottom_navigation_barState extends State<Bottom_navigation_bar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
  
    bottomNavigationBar: GNav(
     backgroundColor: Color(0xFF31364D),
  tabs: [
  
    GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    GButton(
     icon: Icons.verified_user,
      text: 'Profile',
    ),
    GButton(
     icon: Icons.search,
      text: 'Search',
    )
  ]
),
      
    );
  }
}