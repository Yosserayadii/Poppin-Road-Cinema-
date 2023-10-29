import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/backdrop_rating.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri _url = Uri.parse('https://www.youtube.com/watch?v=x8DKg_fsacM');

class body_details extends StatelessWidget {
  final Movie movie;
  const body_details({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      BackdropAndRating(size: size, movie: movie),
      Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: [],
            )),
            SizedBox(
              height: 64,
              width: 64,
            ),
            InkWell(
        
              onTap:
  _launchUrl,

  
  
              
              child: Material(
                elevation: 5, // Add a shadow
                color: Colors.transparent, // Transparent material
                child: Container(
                  width: 50, // Set width and height to make it square
                  height: 50,
                  decoration: BoxDecoration(
                    color: CustomColors.fifthColor, // Background color
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the border radius for slightly rounded corners
                  ),
                  child: Image.asset(
                    'assets/youtube.png', // Replace 'youtube.png' with your image asset file
                    width: 30, // Set the width and height of the image
                    height: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
