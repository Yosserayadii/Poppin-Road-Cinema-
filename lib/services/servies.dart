import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/chatbot/drop_down.dart';
import 'package:poppinroadcimema/Screens/chatbot/text_widget.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';

class Services {
  static Future<void> showModalsheet({required BuildContext context}) async {
    await showModalBottomSheet(
        backgroundColor: CustomColors.thirdColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: TextWidget(label: "Chosen Model")),
                Flexible(flex: 2, child: ModelsDownMenu())
              ],
            ),
          );
        });
  }
}
