import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flare_flutter/base/actor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:poppinroadcimema/Models/Cinema.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Models/MovieActor.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late DatabaseReference _databaseReference;
  List<Cinema> cinemasData = [];

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.reference();
    retrieveCinemasData();
  }

  Future<void> retrieveCinemasData() async {
    try {
      DataSnapshot snapshot = await _databaseReference.child('cinemas').get();
      if (snapshot.value != null && snapshot.value is List) {
        final cinemasDataList = snapshot.value as List<dynamic>;
        cinemasData = cinemasDataList.map((cinemaData) {
          final cinemaMap = Map<String, dynamic>.from(cinemaData);
          final moviesData =
              (cinemaMap['movies'] as List<dynamic>?)?.map((movieData) {
            final movieMap = Map<String, dynamic>.from(movieData);

            // Debug prints to check movieMap and castItem
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
              seance: [],
            );
          }).toList();

          return Cinema(
            image: cinemaMap['image'],
            title: cinemaMap['title'],
            address: cinemaMap['address'],
            location: LatLng(
              cinemaMap['location']['latitude'],
              cinemaMap['location']['longitude'],
            ),
            rating: cinemaMap['rating'],
            movies: moviesData,
          );
        }).toList();
      } else {
        print("No data available from Firebase.");
      }
      setState(() {});
    } catch (error) {
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinema Data from Firebase'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cinemasData.length,
              itemBuilder: (context, index) {
                final cinema = cinemasData[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(cinema.title ?? 'Title Not Available'),
                      subtitle: Text(cinema.address ?? 'Address Not Available'),
                    ),
                    if (cinema.movies != null && cinema.movies!.isNotEmpty)
                      Column(
                        children: cinema.movies!.map((movie) {
                          return ListTile(
                            title: Text(movie.title ?? 'Title Not Available'),
                            subtitle: Text(
                                'Year: ${movie.year ?? 'Year Not Available'}'),
                          );
                        }).toList(),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
