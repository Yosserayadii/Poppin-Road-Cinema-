import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/ticket/movingCard.dart';

class Ticket extends StatelessWidget {
  final Movie movie;
  const Ticket({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/home'); // Navigate to the "otherPage" route
            },
          ),
          title: const Text("Ticket "),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Center(
                child: MovingCardWidget(movie: movie),
              ),
            ],
          ),
        ));
  }
}
