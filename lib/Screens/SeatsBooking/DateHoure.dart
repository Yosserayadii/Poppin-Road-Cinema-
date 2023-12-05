import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/DateAndTime.dart';
import 'package:poppinroadcimema/Screens/ticket/ticket.dart';
import 'package:poppinroadcimema/providers/PriceProvider.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_button.dart';
import 'dart:math' as math;

import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:provider/provider.dart';

class DateHourWidget extends StatefulWidget {
  const DateHourWidget({Key? key});

  @override
  State<DateHourWidget> createState() => _DateHourWidgetState();
}

class _DateHourWidgetState extends State<DateHourWidget> {
  late PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.33, // Adjusted to show three containers in a row
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = Provider.of<PriceProvider>(context).totalPrice;

    return Container(
      padding: EdgeInsets.all(10),
      height: 300, // Increase the height as needed
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 17, 32, 63),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 0, 10, 29),
            spreadRadius: 5,
            blurRadius: 13,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Select date and time"),
          SizedBox(
            height: 150.0, // Adjust the height as needed
            child: Center(
              child: PageView.builder(
                controller: _pageController,
                itemCount: hours.length,
                onPageChanged: (index) {
                  setState(() {
                    initialPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.center,
                    child: index == initialPage
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                margin: EdgeInsets.all(8.0),
                                padding: EdgeInsets.all(24.0),
                                decoration: BoxDecoration(
                                  color: CustomColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.primaryColor
                                          .withOpacity(0.2),
                                      spreadRadius: 6,
                                      blurRadius: 8,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      initialPage = index;
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        hours[index].formattedDayW(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        hours[index].formattedDay(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        hours[index].formattedHour(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              SizedBox(height: 10),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                margin: EdgeInsets.all(8.0),
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      initialPage = index;
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        hours[index].formattedDayW(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        hours[index].formattedDay(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        hours[index].formattedHour(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total price :",
                      style: TextStyle(color: CustomColors.textColor),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "$totalPrice \$",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ticket()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.fifthColor,
                    shadowColor: Color.fromARGB(0, 198, 219, 6),
                    elevation: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: Container(
                    child: Center(
                      child: Text(
                        "Book Ticket",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
