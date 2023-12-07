import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/genre_card.dart';

class Details_genre extends StatelessWidget {
  const Details_genre({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie.genre?.length ?? 0,
          itemBuilder: (context, index) =>
              GenreCard(genre: movie.genre?[index] ?? ''),
        ),
      ),
    );
  }
}
