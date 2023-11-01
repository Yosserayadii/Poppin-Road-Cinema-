import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';

import 'package:poppinroadcimema/reusable_widgets/Bottom_navigation_bar.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class TopFilms extends StatelessWidget {
  const TopFilms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
          child: Text(
            'Populer Now !',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              mainAxisExtent: 250),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movies.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.amberAccent),
              child: Column(children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16) ,
                        bottomLeft: Radius.circular(16)),
                    child: Image.asset(
                      movies.elementAt(index).poster,
                      height: 170,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )),
                    Text(movies.elementAt(index).title)
              ]),
            );
          })
    ]);
  }
}
