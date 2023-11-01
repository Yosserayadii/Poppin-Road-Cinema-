import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
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
                  color: CustomColors.primaryColor),
              child: Stack(children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                    child: Image.asset(
                      movies.elementAt(index).poster,
                      height: 170,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )),
                Positioned(
                  bottom: 10,
                  right: 0,
                  left: 0,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.48,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(197, 40, 40, 54).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 50,
                            color: Colors.black26.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movies.elementAt(index).title,
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 208, 211, 230),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              movies.elementAt(index).rating.toString(),
                                 style: TextStyle(
                                  color: Color.fromARGB(255, 155, 158, 172),
                                  fontSize: 16,
                                  ),
                           
                            ),
                            Text(movies.elementAt(index).plot.length > 40
                                ? '${movies.elementAt(index).plot.substring(0, 40)}...'
                                : movies.elementAt(index).plot ,
                                
                                   style: TextStyle(
                                  color: Color.fromARGB(255, 143, 145, 159),
                                  fontSize: 16, ),
                           ),
                          ],
                        ),
                      )),
                ),
              ]),
            );
          })
    ]);
  }
}
