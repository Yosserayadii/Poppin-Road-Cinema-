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
              padding: EdgeInsets.only(top: 15.0, left: 15, bottom:5 ),
              child: Text(
                'Populer Now !',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
           Padding(
        padding: EdgeInsets.all(20),
        child: 
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  mainAxisExtent: 170),
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
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16)),
                        child: Image.asset(
                          movies.elementAt(index).poster,
                          height: 170,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.48,
                          height: 50,
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
                            padding: const EdgeInsets.all(7.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                    Text(
                                      movies.elementAt(index).title,
                                      style: TextStyle(
                                          color: const Color.fromARGB(255, 208, 211, 230),
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 9),
                                      child: 
                                      Row(
                                        children: [
                                          
                                    Text(
                                      movies.elementAt(index).rating.toString(),
                                         style: TextStyle(
                                          color: const Color.fromARGB(255, 208, 211, 230),
                                          fontSize: 12,
                                          ),
                                    ) , 
                                    Icon( Icons.star , size: 15, color: Colors.amberAccent, )                               
                                        ],
                                      )
                                    ),
                                  
                                
                              ],
                            ),
                          )),
                    ),
                  ]),
                );
              })
      ),
    ]);
  }
}
