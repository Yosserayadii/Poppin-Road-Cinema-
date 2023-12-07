import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:poppinroadcimema/Models/Movie.dart';
import 'package:poppinroadcimema/Screens/ticket/qr_genreator.dart';
import 'package:poppinroadcimema/Screens/ticket/zigzag.dart';
import 'package:poppinroadcimema/providers/PriceProvider.dart';
import 'package:poppinroadcimema/providers/SelectedSeatsProvider.dart';
import 'package:provider/provider.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:share_plus/share_plus.dart';

class TicketFront extends StatefulWidget {
  final Movie movie;
  const TicketFront({super.key, required this.movie});

  @override
  State<TicketFront> createState() => _TicketFrontState();
}

class _TicketFrontState extends State<TicketFront> {
  @override
  Widget build(BuildContext context) {
    final seats =
        Provider.of<SelectedSeatsProvider>(context).selectedSeatNumbers;
    final test = Provider.of<SelectedSeatsProvider>(context);

    final movie = widget.movie;
    final priceProvider =
        Provider.of<PriceProvider>(context); // Accédez à PriceProvider

    // Utilisez priceProvider.totalPrice pour obtenir la valeur du prix
    double totalPrice = priceProvider.totalPrice;

    double _progress = 0.0;
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
                      child: Image.network(
                        "${movie.backdrop}",
                        height: 150,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${movie.title}",
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
                          "Pathé Tunis City",
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
                            ticketDetails("Price", "$totalPrice DT"),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              FileDownloader.downloadFile(
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/test-54e68.appspot.com/o/tickets%2FDocument1(1).pdf?alt=media&token=4a1ed8a2-6766-449a-890a-f2b2ce29a093',
                                onDownloadCompleted: (String path) {
                                  _showSnackBar(
                                      "Your ticket has been saved successfully");
                                },
                              );
                            },
                            child: Icon(Icons.download)),
                        ElevatedButton(
                            onPressed: () async {
                              final url = Uri.parse(
                                  'https://firebasestorage.googleapis.com/v0/b/test-54e68.appspot.com/o/tickets%2FDocument1(1).pdf?alt=media&token=4a1ed8a2-6766-449a-890a-f2b2ce29a093');
                              final response = await http.get(url);
                              final bytes = response.bodyBytes;

                              final temp = await getTemporaryDirectory();
                              final path = '${temp.path}/image.pdf';
                              File(path).writeAsBytesSync(bytes);

                              await Share.shareFiles([path],
                                  text:
                                      'check out my website https://example.com');
                            },
                            child: Icon(Icons.share)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
        ));
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
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
// Widget seatsList({required List<String> list}) => Column(
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
                      color: Color.fromARGB(255, 228, 228, 228),
                    ),
                  ),
                );
              })
        ],
      );
}
