import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

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

  @override
  Widget build(BuildContext context) {
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
                image: AssetImage(widget.movie.backdrop),
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
                          _showRatingPopUp(context);
                        },
                        child: Lottie.asset(
                          'assets/animated_star.json',
                          width: 50, // Adjust width as needed
                          height: 50, // Adjust height as needed
                        ),
                      ),
                      SizedBox(height: 2),
                      Text("Rate this Movie" ,
                      style: TextStyle(
                      color: Colors.black   
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
                      color: Colors.black   
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

  void _showRatingPopUp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color.fromARGB(127, 49, 54, 77), // Background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rate this movie",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final starNumber = index + 1;
                  bool isSelected = starNumber <= selectedRating;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRating = starNumber;
                      });
                    },
                    child: Icon(FeatherIcons.star,
                        size: 40,
                        color: isSelected
                            ? Colors.amber
                            : CustomColors.primaryColor),
                  );
                }),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle the submit button action
                  Navigator.of(context).pop(); // Close the pop-up
                },
                child: Text("Submit"),
              ),
            ],
          ),
        );
      },
    );
  }
}
