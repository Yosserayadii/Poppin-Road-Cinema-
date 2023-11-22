
import 'package:dialogflow_flutter/dialogflowFlutter.dart';
import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:dialogflow_flutter/language.dart';
import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/chat_message.dart';
import 'package:poppinroadcimema/reusable_widgets/Custom_colors.dart';


class chatHome extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<chatHome> {
  List<ChatMessage> messages = [];
  TextEditingController _inputMessageController = new TextEditingController();
  late DialogFlow dialogflow;
  late AuthGoogle authGoogle;
  ScrollController _scrollController = new ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await initiateDialogFlow();
    });
  }

  @override
  Widget build(BuildContext context) {
    _scrollToBottom();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(82, 23, 27, 48),
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Poppin Road Cinema",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "🟢 Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            chatSpaceWidget(),
            Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.blueGrey,
            ),
            bottomChatView()
          ],
        ),
      ),
    );
  }

  Widget chatSpaceWidget() {
    return Flexible(
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType == "receiver"
                              ? CustomColors.textColor
                              : const Color.fromARGB(123, 118, 136, 218)),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          messages[index].messageContent,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget bottomChatView() {
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
      height: 60,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              controller: _inputMessageController,
              onSubmitted: (String str) {
                fetchFromDialogFlow(str);
              },
              decoration: InputDecoration(
                  hintText: "Write message...",
                  hintStyle: TextStyle(color: CustomColors.textColor),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              fetchFromDialogFlow(_inputMessageController.text);
            },
            child: Icon(
              Icons.send,
              color: CustomColors.primaryColor,
              size: 18,
            ),
            backgroundColor: CustomColors.fifthColor,
            elevation: 0,
          ),
        ],
      ),
    );
  }

  _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  initiateDialogFlow() async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/cred.json").build();
    dialogflow = DialogFlow(authGoogle: authGoogle, language: Language.english);
  }

  fetchFromDialogFlow(String input) async {
    _inputMessageController.clear();
    setState(() {
      messages.add(ChatMessage(messageContent: input, messageType: "sender"));
    });

    AIResponse response = await dialogflow.detectIntent(input);
   String message = response.getMessage() ?? 'Default Message';
messages.add(ChatMessage(
    messageContent: message, 
    messageType: "receiver"
));
    setState(() {});
  }
}