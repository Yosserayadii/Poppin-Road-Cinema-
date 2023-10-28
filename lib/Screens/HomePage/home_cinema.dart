import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/HomePage/body.dart';
import 'package:poppinroadcimema/Screens/Map/Map.dart';

class HomeCinema extends StatefulWidget {
  @override
  State createState() => _HomeState();
}

class _HomeState extends State<HomeCinema> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("let's take set and relax !"),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapScreen()),
                    );
                  },
                  child: const Icon(
                    Icons.location_on_rounded,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.search),
                )),
          ],
        ),
        body: body());
  }
}
