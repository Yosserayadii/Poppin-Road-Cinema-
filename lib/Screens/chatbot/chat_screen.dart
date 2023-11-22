import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:poppinroadcimema/Models/ChatModel.dart';
import 'package:poppinroadcimema/Models/chat_discu.dart';
import 'package:poppinroadcimema/Screens/chatbot/chat_widget.dart';
import 'package:poppinroadcimema/Screens/chatbot/text_widget.dart';
import 'package:poppinroadcimema/providers/models_provider.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';
import 'package:poppinroadcimema/services/api_services.dart';
import 'package:poppinroadcimema/services/assets_manager.dart';
import 'package:poppinroadcimema/services/servies.dart';
import 'package:provider/provider.dart';

class chat_screen extends StatefulWidget {
  const chat_screen({super.key});

  @override
  State<chat_screen> createState() => _chat_screenState();
}

class _chat_screenState extends State<chat_screen> {
  bool _isTyping = false;
  late TextEditingController textEditingController;
  List<ChatDiscu> ChatList = []; // Declare ChatList here

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openAiLogo),
        ),
        title: Text("Poppin Road Bot"),
        actions: [
          IconButton(
            onPressed: () async {
              await Services.showModalsheet(context: context);
            },
            icon: Icon(Icons.more_vert_rounded, color: CustomColors.textColor),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: ChatList.length,
                itemBuilder: (context, index) {
                  return ChatWidget(
                    msg: ChatList[index].msg,
                    chatIndex: ChatList[index].chatIndex,
                  );
                },
              ),
            ),
            if (_isTyping)
              ...[
                const SpinKitChasingDots(
                  color: CustomColors.fifthColor,
                  size: 18,
                ),
              ],
            SizedBox(height: 20),
            Material(
              color: CustomColors.thirdColor,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      onSubmitted: (value) async {
                        //send message
                        await sendMessageFCT(modelsProvider: modelsProvider);
                      },
                      decoration: InputDecoration.collapsed(
                          hintText: "How can I help you",
                          hintStyle: TextStyle(color: CustomColors.textColor)),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await sendMessageFCT(modelsProvider: modelsProvider);
                    },
                    icon: Icon(Icons.send, color: CustomColors.fifthColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> sendMessageFCT({required ModelsProvider modelsProvider}) async {
   try {
  setState(() {
    _isTyping = true;
    ChatList.add(ChatDiscu(msg: textEditingController.text, chatIndex: 0));
    textEditingController.clear();
  });
  List<ChatDiscu> newMessages = (await ApiService.sendMessage(
    message: textEditingController.text,
    modelId: modelsProvider.currentModel,
  )) as List<ChatDiscu>;

  setState(() {
    ChatList.addAll(newMessages);
    _isTyping = false;
  });
} catch (error) {
  log("error $error");
  setState(() {
    _isTyping = false;
  });
}

  }
}
