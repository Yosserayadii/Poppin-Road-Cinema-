import 'package:flutter/material.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class GenreCard extends StatelessWidget {
  final String genre;

const GenreCard({Key? key, required this.genre}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return  Container
    (
   margin: EdgeInsets.only(left:10),
   padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
   decoration: BoxDecoration(
    border: Border.all( color: Color(0xFF049FB4)),
    borderRadius: BorderRadius.circular(20)
   ),
      child: Text(genre , style: TextStyle(
        color:  Color(0xFF049FB4)
      ) ),
    );
  }
} 