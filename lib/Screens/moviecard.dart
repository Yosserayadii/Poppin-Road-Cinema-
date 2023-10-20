import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/details_screen.dart';

class CardMovie extends StatelessWidget {
  final Movie movie;
  const CardMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => details_Screen(movie:movie))
        ),
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black,
                    ),
                  ],
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(movie.poster))),
            )),
            Padding(padding:EdgeInsets.symmetric(vertical : 10),
            child: Text(
              movie.title , 
              style : Theme.of(context).textTheme.headline5
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/star.png"),
                height: 20,
                
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${movie.rating}",
                  style: Theme.of(context).textTheme.bodyText2,
                )
        
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
