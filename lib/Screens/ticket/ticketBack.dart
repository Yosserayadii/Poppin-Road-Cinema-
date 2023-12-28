import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketBack extends StatelessWidget {
  const TicketBack({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    TicketWidget(
      height: 600,
      width: 300,
      padding: EdgeInsets.all(20),
      color:  Color.fromARGB(255, 23, 27, 48) ,

   isCornerRounded: true,
      
      child: Container(
     
      child: Image.asset("assets/logo.png" , fit: BoxFit.contain,),

      )
    );
  }
   
 
}
