import 'package:chat_app/constants.dart';
import 'package:chat_app/models/messages_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MsgBubble extends StatelessWidget {
  MsgBubble({required this.msg, super.key});

  MessagesModel msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(10),
        //alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
              topRight: Radius.circular(32)),
        ),
        child: Text(
          msg.msg,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MsgBubbleFriend extends StatelessWidget {
  MsgBubbleFriend({required this.msg, super.key});

  MessagesModel msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(10),
        //alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          color: Color(0xff006D84),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
              topRight: Radius.circular(32)),
        ),
        child: Text(
          msg.msg,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
