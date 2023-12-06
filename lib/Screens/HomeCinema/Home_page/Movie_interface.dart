import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Cinema.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Models/MovieActor.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/Category_list.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/genres.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/movie_carousel.dart';

class MovieInterface extends StatefulWidget {
  final Cinema selectedCinema;

  const MovieInterface({super.key, required this.selectedCinema});

  @override
  State<MovieInterface> createState() => _MovieInterfaceState();
}

class _MovieInterfaceState extends State<MovieInterface> {
  @override
  Widget build(BuildContext context) {
    final cinemaTitle = widget.selectedCinema.title ?? 'Unknown Cinema';
    // print('Selected Cinema Data: ${widget.selectedCinema.movies}');
    final List<Movie> listMovies = widget.selectedCinema.movies ?? [];
    //print('Data...333: ${movies[0]}');

    return Scaffold(
      appBar: AppBar(title: Text(cinemaTitle)),
      body: Column(
        children: [
          CategoryList(title: cinemaTitle),
          Genre(),
          MovieCaroussel(listMovies: listMovies),
        ],
      ),
    );
  }
}
