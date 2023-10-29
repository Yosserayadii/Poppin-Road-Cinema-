import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Home_page/body.dart';
import 'package:poppinroadcimema/reusable_widgets/Bottom_navigation_bar.dart';

import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
   appBar: AppBar(
    backgroundColor: CustomColors.secondaryColor,
    elevation: 0,
    leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
   ),
   body: body()
    );
  }
}
