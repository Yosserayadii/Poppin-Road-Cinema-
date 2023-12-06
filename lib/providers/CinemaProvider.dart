import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:latlong2/latlong.dart';
import 'package:poppinroadcimema/Models/Cinema.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Models/MovieActor.dart';
import 'package:poppinroadcimema/Models/Seance.dart';

class CinemaProvider with ChangeNotifier {
  late DatabaseReference _databaseReference;
  List<Cinema> cinemasData = [];
  List<Cinema> filteredCinemas = [];

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

        List<Movie>? moviesList = [];
        if (cinemaMap['movies'] != null && cinemaMap['movies'] is List) {
          final moviesDataList = cinemaMap['movies'] as List<dynamic>;
          moviesList = moviesDataList.map((movieData) {
            final movieMap = Map<String, dynamic>.from(movieData);

            final List<MovieActor>? castList =
                (movieMap['cast'] as List<dynamic>?)?.map((castItem) {
                      return MovieActor(
                        image: castItem['image'],
                        movieName: castItem['movieName'],
                        originalName: castItem['originalName'],
                      );
                    }).toList() ??
                    [];

            final List<Seance>? seanceList =
                (movieMap['seance'] as List<dynamic>?)?.map((seanceData) {
                      final seanceMap = Map<String, dynamic>.from(seanceData);

                      final List<Seat>? seatsList =
                          (seanceMap['seats'] as List<dynamic>?)
                                  ?.map((seatData) {
                                return Seat(
                                  available: seatData['avalible'],
                                  ref: seatData['ref'],
                                );
                              })?.toList() ??
                              [];

                      final List<Booking>? bookingsList =
                          (seanceMap['Booking'] as List<dynamic>?)
                                  ?.map((bookingData) {
                                final bookingMap =
                                    Map<String, dynamic>.from(bookingData);

                                return Booking(
                                  date: bookingMap['Date'],
                                  email: bookingMap['email'],
                                  seats: List<String>.from(bookingMap['seats']),
                                  tel: bookingMap['tel'],
                                );
                              })?.toList() ??
                              [];

                      return Seance(
                        ref: seanceMap['ref'],
                        salle: seanceMap['salle'],
                        seats: seatsList,
                        bookings: bookingsList,
                      );
                    })?.toList() ??
                    [];

            return Movie(
              backdrop: movieMap['backdrop'],
              cast: castList,
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
              seance: seanceList,
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

      cinemasData.addAll(tempCinemasData);
    } else {
      print("No data available from Firebase.");
    }
    notifyListeners();
  }

  void searchCinemas(String keyword) {
    if (keyword.isEmpty) {
      filteredCinemas = List.from(cinemasData);
    } else {
      filteredCinemas = cinemasData
          .where((cinema) =>
              cinema.title!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }

  void searchMovies(String keyword) {
    if (keyword.isEmpty) {
      filteredCinemas = List.from(cinemasData);
    } else {
      filteredCinemas = cinemasData
          .where((cinema) =>
              cinema.movies?.any((movie) =>
                  movie.title?.toLowerCase().contains(keyword.toLowerCase()) ??
                  false) ??
              false)
          .toList();
    }

    notifyListeners();
  }
}
