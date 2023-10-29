import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Movie_details/body_details.dart';

class details_Screen extends StatelessWidget {
  late  Movie movie;
   details_Screen({super.key , required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold
  (
   
   body: 
   SingleChildScrollView(child:  body_details(movie:movie), )

  
  );
  }
}