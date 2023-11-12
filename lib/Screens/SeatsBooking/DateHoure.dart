import 'package:flutter/material.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class DateHourWidget extends StatefulWidget {
  const DateHourWidget({super.key});

  @override
  State<DateHourWidget> createState() => _DateHourWidgetState();
}

class _DateHourWidgetState extends State<DateHourWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(123, 0, 42, 230),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 201, 197, 228).withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Text('hello'),
          ],
        ),
      ),
    );
  }
}
