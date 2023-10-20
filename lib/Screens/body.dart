import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/Category_list.dart';
import 'package:poppinroadcimema/Screens/genre_card.dart';
import 'package:poppinroadcimema/Screens/genres.dart';
import 'package:poppinroadcimema/Screens/movie_carousel.dart';
import 'package:poppinroadcimema/Screens/moviecard.dart';
import 'package:poppinroadcimema/reusable_widgets/Bottom_navigation_bar.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';


class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        CategoryList(),
        Genre(),
        MovieCaroussel(),
      ],
    );
  }
}

