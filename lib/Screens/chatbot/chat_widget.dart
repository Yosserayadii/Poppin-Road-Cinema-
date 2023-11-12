import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/chatbot/text_widget.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:poppinroadcimema/services/assets_manager.dart';

class ChatWidget extends StatelessWidget {
const ChatWidget({super.key, required this.msg, required this.chatIndex});
 final String msg ; 
 final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex==0 ?Color.fromARGB(123, 91, 109, 203): CustomColors.textColor  , 
           child: Padding(padding: const EdgeInsets.all(8.0),
           child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
              chatIndex==0 ?AssetsManager.userimg : AssetsManager.botImg , height: 32,width: 32,
              ) , 
              SizedBox(width:10),
             Expanded(child: TextWidget(label:msg)),
             chatIndex==0? const SizedBox.shrink():
              Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.thumb_up_alt_outlined,
                color: CustomColors.primaryColor,),
                SizedBox(width: 5,),
                Icon(Icons.thumb_down_alt_outlined,
                color: CustomColors.primaryColor,),
              ],
             )
            ],
          ),
          
          ),
        )
      ],
    );
  }
}