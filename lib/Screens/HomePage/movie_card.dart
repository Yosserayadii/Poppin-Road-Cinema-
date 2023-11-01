import 'package:flutter/material.dart';
import 'package:poppinroadcimema/utils/star_calculator.dart'
    as starCalculator;
class MovieCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    List<Widget> stars = starCalculator.getStars(rating: 2.5 , starSize: 2 );

    return GestureDetector(
      onTap: () async {
      },
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Stack(
          children: [
            Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.2),
                
                ),
              ),
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.amberAccent ,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Wrap(
                                children: [
                                  Text("test ",
                                    ),
                                  Text("15"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.5),
                        if (5 != 0) Row(children: stars),
                        SizedBox(height: 1),
                        Text(
                          "test previe",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
