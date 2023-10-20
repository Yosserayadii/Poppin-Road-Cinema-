import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'dart:math' as math;

import 'package:poppinroadcimema/Screens/moviecard.dart';
class MovieCaroussel extends StatefulWidget {
  const MovieCaroussel({super.key});

  @override
  State<MovieCaroussel> createState() => _MovieCarousselState();
}

class _MovieCarousselState extends State<MovieCaroussel> {
  late PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value){
            setState(() {
             initialPage=value;
            });
          },
          controller: _pageController,
          itemCount: movies.length,
          itemBuilder: (context, index) =>
              buildMovieSlider(index),
        ),
      ),
    );
  }

  Widget buildMovieSlider(int index) =>AnimatedBuilder(
  animation: _pageController,
  builder: (context,child){
    double value=0;
    if(_pageController.position.haveDimensions){
      final page = _pageController.page ?? 0.0; // Use 0.0 as the default value if it's null
      value = index - page;
      value = (value * 0.10).clamp(-1, 1) ;
    }
  return AnimatedOpacity(
    duration: Duration(milliseconds: 350),
    opacity: initialPage==index?1:0.4,
    child: Transform.rotate(
      angle: math.pi * value,
      child: CardMovie(movie: movies[index])),
  );
  }
   
  ) ;

}
