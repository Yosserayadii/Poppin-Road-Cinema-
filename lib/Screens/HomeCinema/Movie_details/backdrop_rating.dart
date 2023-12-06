import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:poppinroadcimema/Authentification/signin.dart';
import 'package:poppinroadcimema/Authentification/welcome.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/providers/UserProvider.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:provider/provider.dart';

import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class BackdropAndRating extends StatefulWidget {
  const BackdropAndRating({
    Key? key,
    required this.size,
    required this.movie,
  }) : super(key: key);

  final Size size;
  final Movie movie;

  @override
  _BackdropAndRatingState createState() => _BackdropAndRatingState();
}

class _BackdropAndRatingState extends State<BackdropAndRating> {
  int selectedRating = 0;
  double value = 3.5;
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            height: widget.size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    NetworkImage(widget.movie.backdrop ?? 'default_image.jpeg'),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: widget.size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromARGB(172, 228, 228, 228),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Colors.black26.withOpacity(0.5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.video,
                        size: 40,
                        color: Color(0xFF049FB4),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "${widget.movie.rating}/",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(text: "10"),
                          ],
                        ),
                      ),
                      Text(
                        '150,222',
                        style: TextStyle(
                          color: Color.fromARGB(255, 139, 141, 143),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (userProvider.user == null) {
                            _showRatingPopUpToLogin(context);
                          } else {
                            _showRatingPopUp(context);
                          }
                        },
                        child: Lottie.asset(
                          'assets/animated_star.json',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Rate this Movie",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: CustomColors.fifthColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          "${widget.movie.metascoreRating}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Meta Score",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${widget.movie.criticsReview} critic reviews",
                        style: TextStyle(
                          color: Color.fromARGB(255, 139, 141, 143),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: BackButton(),
          ),
        ],
      ),
    );
  }

  void _showRatingPopUp(BuildContext context,
      {double ratingStarsSize = 30.0,
      double dialogWidth = 300.0,
      double dialogHeight = 50.0}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double value = 1 ;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Thank you For Rating this Film"),
              content: Container(
                width: dialogWidth,
                height: dialogHeight,
                child:  Center(
          child: RatingStars(
            value: value,
            onValueChanged: (v) {
              //
              setState(() {
                value = v;
              });
            },
            
            starCount: 5,
            starSize: 30,
            valueLabelColor: const Color(0xff9b9b9b),
            valueLabelTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
            valueLabelRadius: 10,
            maxValue: 5,
            starSpacing: 5,
            maxValueVisibility: true,
            valueLabelVisibility: false,
            animationDuration: Duration(milliseconds: 1000),
            valueLabelPadding:
                const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            valueLabelMargin: const EdgeInsets.only(right: 8),
            starOffColor: const Color(0xffe7e8ea),
            starColor: Colors.yellow,
          ),
        ),

              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

void _showRatingPopUpToLogin(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("You must be connected to submit your review"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
            child: Text("Login"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Cancel"),
          ),
        ],
      );
    },
  );
}
