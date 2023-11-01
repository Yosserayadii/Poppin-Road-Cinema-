import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/HomePage/body.dart';
import 'package:poppinroadcimema/Screens/Map/Map.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:poppinroadcimema/Screens/Map/MapScreen.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

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
                    _showMapPopUp(context);
                  },
                  child: const Icon(
                    Icons.location_on_rounded,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapScreen()),
                    );
                  },
                  child: const Icon(Icons.search),
                )),
          ],
        ),
        body: BodyHomePage());
  }

  void _showMapPopUp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: CustomColors.primaryColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 35, 25, 110)
                      .withOpacity(0.2), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 3), // Offset in the x, y direction
                ),
              ],
            ),
            child: Column(
              children: [
                // Draggable area (grey bar)
                Container(
                  width: 40.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 205, 205, 205),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // Your content (e.g., MapWidget)
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24.0))),
                  height: MediaQuery.of(context).size.height - 100,
                  child: MapWidget(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
