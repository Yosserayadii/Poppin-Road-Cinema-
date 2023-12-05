import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:latlong2/latlong.dart';
import 'package:poppinroadcimema/Models/Cinema.dart';

class CinemaProvider with ChangeNotifier {
  late DatabaseReference _databaseReference;
  List<Cinema> cinemasData = [];

  CinemaProvider() {
    _databaseReference = FirebaseDatabase.instance.reference();
    _retrieveCinemasData();
  }

  Future<void> _retrieveCinemasData() async {
    DataSnapshot snapshot = await _databaseReference.child('cinemas').get();
    if (snapshot.value != null && snapshot.value is List) {
      final cinemasDataList = snapshot.value as List<dynamic>;
      cinemasData = cinemasDataList.map((CinemaProvider) {
        final cinemaMap = Map<String, dynamic>.from(CinemaProvider);
        return Cinema(
          image: cinemaMap['image'],
          title: cinemaMap['title'],
          address: cinemaMap['address'],
          location: LatLng(
            cinemaMap['location']['latitude'],
            cinemaMap['location']['longitude'],
          ),
          rating: cinemaMap['rating'],
        );
      }).toList();
    } else {
      print("No data available from Firebase.");
    }
    notifyListeners();
  }
}
