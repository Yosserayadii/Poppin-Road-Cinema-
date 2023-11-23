import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/ticket/qr_genreator.dart';
import 'package:poppinroadcimema/Screens/ticket/zigzag.dart'; 
import 'package:ticket_widget/ticket_widget.dart';

class TicketFront extends StatefulWidget {
  const TicketFront({super.key});

  @override
  State<TicketFront> createState() => _TicketFrontState();
}

class _TicketFrontState extends State<TicketFront> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: TicketWidget(
          height: MediaQuery.of(context).size.height * 0.8,
          width: 300,
          isCornerRounded: true,
          color: Color.fromARGB(255, 16, 52, 93),
          padding: EdgeInsets.all(5),
          child: Container(
              child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/P16-17-pix-1-1.jpg",
                            height: 150, width: 300, fit: BoxFit.cover)),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "The Fault in Our Stars",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 228, 228, 228),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on,
                            color: Color(0xFF049FB4), size: 18),
                        Text(
                          "Pathy , Tunis City",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF049FB4)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ticketDetails("Time", "8 am"),
                            Container(
                              height: 55,
                              width: 1,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(37, 4, 159, 180),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            ticketDetails("Price", "30 DT"),
                            Container(
                              height: 55,
                              width: 1,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(37, 4, 159, 180),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            ticketDetails("Salle", "17"),
                          ],
                        ),
                        CustomPaint(
                          size: Size(double.infinity, 20),
                          painter: DashedLinePainter(),
                        ),
                        SizedBox(height: 5),
                        seatsList()
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                   QrGeretor(),
                    SizedBox(
                      height: 15,
                    ),
                    Positioned(
                        bottom: 0,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 247, 1, 17),
                            shadowColor: Color.fromARGB(0, 198, 219, 6),
                            elevation: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          child: Container(
                            height: 40,
                            width: 150,
                            child: Center(
                              child: Text(
                                'Downald',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          )),
        ));
  }

  Widget ticketDetails(String title, String details) => Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 228, 228, 228),
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5),
          Container(
              height: 30,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                details,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF049FB4)),
              ))
        ],
      );
  List<String> seats = ['A1', 'A2', 'B1', 'B3'];

  Widget seatsList() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Seats',
            style: TextStyle(
              color: Color.fromARGB(255, 228, 228, 228),
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 30),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: seats.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Container(
                  height: 30,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(37, 4, 159, 180),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    seats[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color:                Color.fromARGB(255, 228, 228, 228),
                    ),
                  ),
                );
              })
        ],
      );
}
