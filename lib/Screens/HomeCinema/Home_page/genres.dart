import 'package:flutter/material.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class Genre extends StatefulWidget {
  const Genre({Key? key}) : super(key: key);

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: 50, 
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(49, 54, 77,
                              0.486), 
                          borderRadius: BorderRadius.circular(
                              10), 
                        ),
                        child: Center(
                          child: Image.asset('assets/grinning.png',
                              width:
                                  25, 
                              height: 25),
                        ),
                      ),
                      Text(
                        'Comedy',
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 187, 187)
                                .withOpacity(0.5),
                            fontWeight: FontWeight.bold
                          
                            ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: 50, 
                        height: 50,
                        decoration: BoxDecoration(
                          color: CustomColors
                              .secondaryColor, 
                          borderRadius: BorderRadius.circular(
                              10),
                        ),
                        child: Center(
                          child: Image.asset('assets/love.png',
                              width:
                                  25, 
                              height: 25),
                        ),
                      ),
                      Text(
                        'Romance',
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 187, 187)
                                .withOpacity(0.5),
                            fontWeight: FontWeight.bold
                           
                            ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: CustomColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Image.asset('assets/bew.png',
                              width:
                                  25,
                              height: 25),
                        ),
                      ),
                      Text(
                        'Horror',
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 187, 187)
                                .withOpacity(0.5),
                            fontWeight: FontWeight.bold
                           
                            ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: CustomColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Image.asset('assets/tongue.png',
                              width:
                                  25, 
                              height: 25),
                        ),
                      ),
                      Text(
                        'Drama',
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 187, 187)
                                .withOpacity(0.5),
                            fontWeight: FontWeight.bold
                           
                            ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
