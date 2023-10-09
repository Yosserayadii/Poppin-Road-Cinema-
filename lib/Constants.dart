import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class AppConstants {
  // static const String mapBoxAccessToken =
  //     'pk.eyJ1IjoiY2hhcmxpZTQ0NyIsImEiOiJjbG5kMXF5MGQwMHU4MmttbmdkNTR3Mno4In0.Zp6XHs7fs70FNAqt73kJUQ';
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoiY2hhcmxpZTQ0NyIsImEiOiJjbGVmcGhmZDcwdDc4M29tanRnOG5hbHUwIn0.gR8hNxBIUFLabHFrGfOYTw';

  // static const String mapBoxStyleId = 'clnd1lnsr03o401qudtdvcoar';
  static const String mapBoxStyleId = 'clnhy7iyx025b01qn107677t3';

  static final myLocation = LatLng(51.5090214, -0.1982948);

  static Future<LatLng> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting location: $e');
      return myLocation; // Return a default location in case of an error
    }
  }
}
