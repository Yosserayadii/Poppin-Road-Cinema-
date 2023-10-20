import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(movie.backdrop))),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromARGB(244, 49, 54, 77),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 50,
                      color: Colors.black26.withOpacity(0.5)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/star.png",
                        height: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "${movie.rating}/",
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
                            color: Color.fromARGB(255, 139, 141, 143)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        "assets/favorites.png",
                        height: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Rate this",
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 141, 143)),
                      )
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
                            "${movie.metascoreRating}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Meta Score",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "62 critic reviews",
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 141, 143)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SafeArea(child: BackButton())
        ],
      ),
    );
  }
}
