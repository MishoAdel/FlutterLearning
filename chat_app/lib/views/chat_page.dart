import 'package:chat_app/constants.dart';
import 'package:chat_app/models/messages_model.dart';
import 'package:chat_app/widgets/msg_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Stream<QuerySnapshot> _messages = FirebaseFirestore.instance
      .collection('messages')
      .orderBy('createdAt', descending: true)
      .snapshots();

  final _contoller = ScrollController();

  TextEditingController controller = TextEditingController();

  CollectionReference messgaes =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    String myEmail = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: _messages,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessagesModel> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(MessagesModel.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 60,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Chat',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _contoller,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == myEmail
                          ? MsgBubble(msg: messageList[index])
                          : MsgBubbleFriend(msg: messageList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messgaes.add(
                        {
                          'msg': data,
                          'createdAt': DateTime.now(),
                          'id': myEmail
                        },
                      );
                      controller.clear();
                      _contoller.animateTo(
                        0,
                        // _contoller.position.maxScrollExtent,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.send),
                      hintText: 'Send message',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Text('Loading .....');
        }
      },
    );
  }
}
