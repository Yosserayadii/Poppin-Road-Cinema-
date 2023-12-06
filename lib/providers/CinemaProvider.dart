import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:latlong2/latlong.dart';
import 'package:poppinroadcimema/Models/Cinema.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Models/MovieActor.dart';

class CinemaProvider with ChangeNotifier {
  late DatabaseReference _databaseReference;
  List<Cinema> cinemasData = [];
  List<Cinema> filteredCinemas = []; // New list to store filtered cinemas

  CinemaProvider() {
    _databaseReference = FirebaseDatabase.instance.reference();
    _retrieveCinemasData();
  }
  
  

  Future<void> _retrieveCinemasData() async {
    DataSnapshot snapshot = await _databaseReference.child('cinemas').get();
    if (snapshot.value != null && snapshot.value is List) {
      final cinemasDataList = snapshot.value as List<dynamic>;
      List<Cinema> tempCinemasData = cinemasDataList.map((cinemaData) {
        final cinemaMap = Map<String, dynamic>.from(cinemaData);

        // Fetch and map movies data for each cinema
        List<Movie>? moviesList = [];
        if (cinemaMap['movies'] != null && cinemaMap['movies'] is List) {
          final moviesDataList = cinemaMap['movies'] as List<dynamic>;
          moviesList = moviesDataList.map((movieData) {
            final movieMap = Map<String, dynamic>.from(movieData);

            final List<MovieActor>? castList =
                (movieMap['cast'] as List<dynamic>?)?.map((castItem) {
                      print("Cast Item: $castItem");
                      return MovieActor(
                        image: castItem['image'],
                        movieName: castItem['movieName'],
                        originalName: castItem['originalName'],
                      );
                    }).toList() ??
                    [];
            print("cast**** $castList");

            return Movie(
              backdrop: movieMap['backdrop'],
              cast: castList, // You might want to map the cast data as well
              criticsReview: movieMap['criticsReview'],
              genre: List<String>.from(movieMap['genre']),
              id: movieMap['id'],
              metascoreRating: movieMap['metascoreRating'],
              numOfRatings: movieMap['numOfRatings'],
              plot: movieMap['plot'],
              poster: movieMap['poster'],
              rating: movieMap['rating'],
              title: movieMap['title'],
              year: movieMap['year'],
            );
          }).toList();
        }

        return Cinema(
          image: cinemaMap['image'],
          title: cinemaMap['title'],
          address: cinemaMap['address'],
          location: LatLng(
            cinemaMap['location']['latitude'],
            cinemaMap['location']['longitude'],
          ),
          rating: cinemaMap['rating'],
          movies: moviesList,
        );
      }).toList();

      // Use addAll to add all mapped cinemas to the existing list
      cinemasData.addAll(tempCinemasData);
    } else {
      print("No data available from Firebase.");
    }
    notifyListeners();
  }


   void searchCinemas(String keyword) {
    if (keyword.isEmpty) {
      // If the search keyword is empty, show all cinemas
      filteredCinemas = List.from(cinemasData);
    } else {
      // If the search keyword is not empty, filter cinemas based on the keyword
      filteredCinemas = cinemasData
          .where((cinema) =>
              cinema.title!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }


  void searchMovies(String keyword) {
  if (keyword.isEmpty) {
    // If the search keyword is empty, show all movies from all cinemas
    filteredCinemas = List.from(cinemasData);
  } else {
    // If the search keyword is not empty, filter movies based on the keyword
    filteredCinemas = cinemasData
        .where((cinema) =>
            cinema.movies?.any((movie) =>
                movie.title?.toLowerCase().contains(keyword.toLowerCase()) ?? false) ??
            false)
        .toList();
  }

  notifyListeners();
}


}
