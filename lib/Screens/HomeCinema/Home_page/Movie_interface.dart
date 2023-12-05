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
    final moviesData = widget.selectedCinema.movies?.map((movieData) {
      final movieMap = Map<String, dynamic>.from(movieData as Map);
      final List<MovieActor>? castList =
          (movieMap['cast'] as List<dynamic>?)?.map((castItem) {
                return MovieActor(
                  image: castItem['image'],
                  movieName: castItem['movieName'],
                  originalName: castItem['originalName'],
                );
              }).toList() ??
              [];

      return Movie(
        poster: movieMap['poster'],
        backdrop: movieMap['backdrop'],
        title: movieMap['title'],
        id: movieMap['id'],
        plot: movieMap['plot'],
        year: movieMap['year'],
        numOfRatings: movieMap['numOfRatings'],
        criticsReview: movieMap['criticsReview'],
        metascoreRating: movieMap['metascoreRating'],
        rating: movieMap['rating'],
        genre: List<String>.from(movieMap['genre']),
        cast: castList,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(cinemaTitle)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.selectedCinema.movies?.length ?? 0,
              itemBuilder: (context, index) {
                final mvi = widget.selectedCinema.movies?[index];
                print("******movie==== $mvi");
                return ListTile(
                  title: Text('Title: ${mvi?.title}'),
                  subtitle: Text('Year: ${mvi?.year}'),
                );
              },
            ),
          ),
          CategoryList(),
          Genre(),
          MovieCaroussel(),
        ],
      ),
    );
  }
}
