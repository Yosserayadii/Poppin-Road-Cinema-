import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:poppinroadcimema/Screens/chatbot/chat_widget.dart';
import 'package:poppinroadcimema/Screens/chatbot/text_widget.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:poppinroadcimema/services/assets_manager.dart';
import 'package:poppinroadcimema/services/servies.dart';



class chat_screen extends StatefulWidget {
  const chat_screen({super.key});

  @override
  State<chat_screen> createState() => _chat_screenState();
}


class _chat_screenState extends State<chat_screen> {
  final bool _isTyping=true;
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
   textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openAiLogo),
        ),
        title: Text("Poppin Road Bot"),actions: [
          IconButton(onPressed: () async{
         await  Services.showModalsheet(context: context);
          
          }, icon: Icon(Icons.more_vert_rounded , color: CustomColors.textColor,))
        ],
      ),
      body: SafeArea(
        child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context,index) {
               return  ChatWidget(
                msg: CustomColors.ChatMessages[index]["msg"].toString(),
                chatIndex: int.parse(
                  CustomColors.ChatMessages[index]["chatIndex"].toString()
                )
                ,

               );
              }
            ),

          ),
         if (_isTyping)...[
          const SpinKitChasingDots(color: CustomColors.fifthColor,
          size: 18,
          ),
          SizedBox(
            height: 20
          ),
          Material(
            color : CustomColors.thirdColor,
            child: Row(
              children: [
                Expanded(child: 
                TextField(controller: textEditingController,
                
                onSubmitted: (value){
                  //send message 
                },
                decoration: InputDecoration.collapsed(hintText: "How can i help you",hintStyle: TextStyle(color: CustomColors.textColor)),
          
                )
                ) ,
                IconButton(onPressed: (){}, icon: Icon(Icons.send , color: CustomColors.fifthColor))
              ],
            ),
          )
         ]
        ],
        ),
      ),
    );
  }
}
