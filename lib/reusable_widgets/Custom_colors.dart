import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Screens/chatbot/text_widget.dart';

class CustomColors {
  static const Color primaryColor = Color.fromARGB(255, 23, 27, 48);
  static const Color secondaryColor = Color.fromARGB(124, 49, 54, 77);
  static const Color accentColor = Color.fromARGB(255, 89, 90, 98);
  static const Color textColor = Color.fromARGB(255, 104, 117, 143);
  static const Color thirdColor = Color.fromARGB(255, 176, 179, 185);
  static const Color fourthColor = Color.fromARGB(255, 228, 228, 228);
  static const Color fifthColor = Color.fromARGB(255, 247, 1, 17);
  static final ChatMessages = [
    {"msg": "Hello who are you", "chatIndex": "0"},
    {
      "msg": "Am popping Road cinema Bot , how can i help you ? ",
      "chatIndex": "1"
    },
    {"msg": "Whats flutter ?  ", "chatIndex": "0"},
    {
      "msg":
          "Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications from a single codebase for any web browser, Fuchsia, Android, iOS, Linux, macOS, and Windows. First described in 2015, Flutter was released in May 2017. ",
      "chatIndex": "1"
    },
  ];
 static  List<String> models = [
  'Model1',
  'Model2',
  'Model3',
  'Model4',
  'Model5',
  'Model6',
];

static List<DropdownMenuItem<String>>? get getModelsItem {
  List<DropdownMenuItem<String>>? modelsItems =
      List<DropdownMenuItem<String>>.generate(
          models.length,
          (index) => DropdownMenuItem(
              value: models[index],
              child: TextWidget(
                label: models[index],
                fontSize: 15,
              )));
  return modelsItems;
}

}
