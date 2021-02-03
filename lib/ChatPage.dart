import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class ChatPage extends StatefulWidget {
  NetworkImage profilePhoto;
  String name;
  ChatPage(this.name, this.profilePhoto);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
        actions: [
          CircleAvatar(
            radius: 22,
            backgroundImage: widget.profilePhoto,
          ),
          SizedBox(
            width: screenWidth * 0.04,
          ),
        ],
      ),
    );
  }
}
