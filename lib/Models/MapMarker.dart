import 'package:latlong2/latlong.dart';

class MapMarker {
  final String? image;
  final String? title;
  final String? address;
  final LatLng? location;
  final int? rating;

  MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.location,
    required this.rating,
  });
}

final mapMarkers = [
  MapMarker(
      image: 'assets/logo.png',
      title: 'Cinéma Pathé azur cityt',
      address: '8 Plender St, London NW1 0JT, United Kingdom',
      location: LatLng(36.725853, 10.2549809),
      rating: 4),
  MapMarker(
      image: 'assets/logo.png',
      title: 'Cinéma Pathé Tunis City',
      address: '103 Hampstead Rd, London NW1 3EL, United Kingdom',
      location: LatLng(36.8983082, 10.1222151),
      rating: 5),
  MapMarker(
      image: 'assets/logo.png',
      title: 'Cinéma Pathé Mall of Sousse',
      address: '122 Palace Gardens Terrace, London W8 4RT, United Kingdom',
      location: LatLng(35.901849, 10.5410693),
      rating: 2),
  MapMarker(
      image: 'assets/logo.png',
      title: 'ABC Cinéma Tunis',
      address: '2 More London Riverside, London SE1 2AP, United Kingdom',
      location: LatLng(36.7989543, 10.1800283),
      rating: 3),
];
