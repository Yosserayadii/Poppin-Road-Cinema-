import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/Category_list.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/genres.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/movie_carousel.dart';

class Movie_interface extends StatefulWidget {
  const Movie_interface({super.key});

  @override
  State<Movie_interface> createState() => _Movie_interfaceState();
}

class _Movie_interfaceState extends State<Movie_interface> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    CategoryList(),
    Genre(),
    MovieCaroussel(),
      ],
    );
  }
}