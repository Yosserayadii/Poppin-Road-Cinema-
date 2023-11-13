import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Chairs.dart';
import 'package:poppinroadcimema/provider/PriceProvider.dart';
import 'package:provider/provider.dart';

class SeatsScreen extends StatefulWidget {
  @override
  _SeatsScreenState createState() => _SeatsScreenState();
}

class _SeatsScreenState extends State<SeatsScreen> {
  List<List<Chair>> chairsMatrix = generateChairsMatrix(5, 4);

  @override
  Widget build(BuildContext context) {
    List<String> status = ["Selected", "Available", "Unavailable"];
    var selected = 0;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: chairsMatrix.length * chairsMatrix[0].length,
            itemBuilder: (BuildContext context, int index) {
              int rowIndex = index ~/ chairsMatrix[0].length;
              int columnIndex = index % chairsMatrix[0].length;
              Chair chair = chairsMatrix[rowIndex][columnIndex];

              return GestureDetector(
                onTap: () {
                  if (chair.status == 0) {
                    setState(() {
                      chair.status = 2;
                      selected++;
                      // Access the PriceProvider and update the price
                      Provider.of<PriceProvider>(context, listen: false)
                          .updateTotalPrice(chair.price * selected);
                      // Change status to selected
                    });
                  } else if (chair.status == 2) {
                    setState(() {
                      chair.status = 0;
                      selected--; // Change status to available
                      Provider.of<PriceProvider>(context, listen: false)
                          .updateTotalPrice(chair.price * selected);
                    });
                  }
                },
                child: Image.asset(
                  chair.status == 0
                      ? 'assets/chair.png' // Available seat
                      : chair.status == 1
                          ? 'assets/unavailable.png' // Unavailable seat
                          : 'assets/selected_chair.png', // Selected seat
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: status.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              status[index] == "Available"
                                  ? 'assets/chair.png' // Available seat
                                  : status[index] == "Unavailable"
                                      ? 'assets/small_unavailable.png' // Unavailable seat
                                      : 'assets/small_selected_chair.png', // Selected seat
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              status[index],
                              style: TextStyle(fontSize: 12),
                            )
                          ]),
                    )),
          ),
        ],
      ),
    );
  }
}
