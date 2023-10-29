import 'package:flutter/material.dart';

class Cast_card extends StatelessWidget {
  final Map cast;
  const Cast_card({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 20),
        width: 80,
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(cast['image']))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              cast['originalName'],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 2,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              cast['movieName'],
              textAlign: TextAlign.center,
               style: TextStyle(
                        color: const Color.fromARGB(123, 247, 248, 250)),            ),  
          ],
        ));
  }
}
