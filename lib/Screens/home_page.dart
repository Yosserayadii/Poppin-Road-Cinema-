import 'package:flutter/material.dart';
import 'package:poppinroadcimema/reusable_widgets/Bottom_navigation_bar.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_button.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: CustomButton(
            title: 'My Button',
            color: Color(0xFFF70113), 
            onPressed: () {
             
            },

          ),
        ),
      ),
     bottomNavigationBar: Bottom_navigation_bar(),
    );
  }
}
