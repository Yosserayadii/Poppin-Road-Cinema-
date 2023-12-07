import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TitleAndDuration extends StatelessWidget {
  const TitleAndDuration({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(movie.title ?? "title not found",
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    '${movie.year}',
                    style: TextStyle(
                        color: const Color.fromARGB(123, 247, 248, 250)),
                  ),
                  SizedBox(
                    width:
                        20, // Add horizontal spacing between the Text widgets
                  ),
                  Text(
                    'PG-13',
                    style: TextStyle(
                        color: const Color.fromARGB(123, 247, 248, 250)),
                  ),
                  SizedBox(
                    width:
                        20, // Add horizontal spacing between the Text widgets
                  ),
                  Text(
                    '2H 23mns',
                    style: TextStyle(
                        color: const Color.fromARGB(123, 247, 248, 250)),
                  )
                ],
              )
            ],
          )),
          SizedBox(
            height: 64,
            width: 64,
          ),
          InkWell(
            onTap: () async {
              const url = 'https://www.youtube.com/watch?v=x8DKg_fsacM';
              // Parse the URI here
              final Uri uri = Uri.parse(url);

              if (await canLaunch(uri.toString())) {
                await launch(uri.toString());
              } else {
                print('Could not launch $url');
              }
            },
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
    );
  }
}
