import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class KommunicateChatWidget extends StatefulWidget {
  @override
  _KommunicateChatWidgetState createState() => _KommunicateChatWidgetState();
}

class _KommunicateChatWidgetState extends State<KommunicateChatWidget> {
  @override
  void initState() {
    super.initState();
    initializeKommunicate();
  }

  Future<void> initializeKommunicate() async {
    dynamic conversationObject = {
      'appId': '30fef5da9124c7feb4e1656c5913446b', 
    };

    KommunicateFlutterPlugin.buildConversation(conversationObject)
        .then((clientConversationId) {
      print("Conversation builder success : " + clientConversationId.toString());
    }).catchError((error) {
      print("Conversation builder error : " + error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kommunicate Chat Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            initializeKommunicate();
          },
          child: Text('Start Chat'),
        ),
      ),
    );
  }
}