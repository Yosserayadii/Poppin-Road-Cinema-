import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Chairs.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/providers/PriceProvider.dart';
import 'package:provider/provider.dart';

class SeatsScreen extends StatefulWidget {
  final Movie movie;

  SeatsScreen({super.key, required this.movie});

  @override
  _SeatsScreenState createState() => _SeatsScreenState();
}

class _SeatsScreenState extends State<SeatsScreen> {
  List<List<Chair>> chairsMatrix = generateChairsMatrix(5, 4);
  var selected = 0;
  List<Chair> selectedChairs = [];

  @override
  Widget build(BuildContext context) {
    final listSeances = widget.movie.seance;
    List<String> seatNumbers = generateSeatNumbers(selectedChairs);
    List<String> status = ["Selected", "Available", "Unavailable"];

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
                  // int updatedSelected = selected;

                  if (chair.status == 0) {
                    setState(() {
                      chair.status = 2;
                      // selected++;
                      selectedChairs.add(chair);
                      selected++;
                      Provider.of<PriceProvider>(context, listen: false)
                          .updateTotalPrice(chair.price * selected);
                    });
                  } else if (chair.status == 2) {
                    setState(() {
                      chair.status = 0;
                      selectedChairs.remove(chair);
                      selected--;
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Print only the selected seats
          if (selected > 0)
            Text(
              'Selected Seats: ${getSelectedSeatNumbers(selectedChairs)}',
              style: TextStyle(
                color: Color.fromARGB(255, 228, 228, 228),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
        ],
      ),
    );
  }

  List<String> generateSeatNumbers(List<Chair> selectedChairs) {
    List<String> seatNumbers = [];
    for (int i = 0; i < selectedChairs.length; i++) {
      seatNumbers.add(
        selectedChairs[i].row + selectedChairs[i].column.toString(),
      );
    }
    return seatNumbers;
  }

  String getSelectedSeatNumbers(List<Chair> selectedChairs) {
    List<String> selectedSeatNumbers = [];
    for (int i = 0; i < selectedChairs.length; i++) {
      selectedSeatNumbers.add(
        selectedChairs[i].row + selectedChairs[i].column.toString(),
      );
    }
    return selectedSeatNumbers.join(', ');
  }
}
