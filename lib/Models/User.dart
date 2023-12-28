// Our User model
import 'package:poppinroadcimema/Models/Resvation.dart';

class User {
  final int id, score;
  final String barthday, email, image;
  final List<String> Resvations ;

  User({
    required this.id,
    required this.score,
    required this.barthday,
    required this.email,
    required this.image,
    required this.Resvations,
  });
}

// Our demo User data
User user = User(
  id: 1,
  score: 30,
  barthday: "28/01/2000",
  email: "grindi.maha@gmail.com",
  image: "assets/onward.jpeg",
  Resvations : [ "1" , "4" , "5" ]
);
