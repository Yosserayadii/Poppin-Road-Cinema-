import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/Category_list.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/genre_card.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/genres.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/movie_carousel.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/moviecard.dart';
import 'package:poppinroadcimema/reusable_widgets/Bottom_navigation_bar.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';


class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: 
    Container(
      child: BottomNavigationbar(),
    ),
  
);

}

}