import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';
import 'chatDetailPage.dart';

class ChatPage extends StatefulWidget {
  NetworkImage profilePhoto;
  String senderUserName;
  String senderId;
  ChatPage(
    this.senderUserName,
    this.senderId,
    this.profilePhoto,
  );
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController msgTextController = TextEditingController();

  DatabaseReference _chatReference =
      FirebaseDatabase.instance.reference().child('chat');

  String currentUser = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    String userChild =
        FirebaseAuth.instance.currentUser.email == "admin@mecare.com" ||
                FirebaseAuth.instance.currentUser.email == "doctor@mecare.com"
            ? widget.senderUserName == "admin@mecare" ||
                    widget.senderUserName == "doctor@mecare"
                ? "hopital"
                : widget.senderId
            : FirebaseAuth.instance.currentUser.uid;

    String mecareChild =
        FirebaseAuth.instance.currentUser.email == "admin@mecare.com"
            ? widget.senderUserName == "doctor@mecare"
                ? "staf"
                : FirebaseAuth.instance.currentUser.uid
            : FirebaseAuth.instance.currentUser.email == "doctor@mecare.com"
                ? widget.senderUserName == "admin@mecare"
                    ? "staf"
                    : FirebaseAuth.instance.currentUser.uid
                : widget.senderId;

    Query _query = FirebaseDatabase.instance
        .reference()
        .child('chat')
        .child(userChild)
        .child(mecareChild);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.senderUserName),
          actions: [
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => PatientDatails(
                //         datails: widget.senderUserName,
                //       ),
                //     ));
              },
              child: CircleAvatar(
                radius: 22,
                backgroundImage: widget.profilePhoto,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.04,
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
                height: screenHeight * 0.8,
                color: Color(0xfff5f6f1),
                child: FirebaseAnimatedList(
                  query: _query,
                  itemBuilder: (context, snapshot, animation, index) {
                    return sendMessage(
                        snapshot.value['message'], snapshot.value['author']);
                  },
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  color: Color(0xffffffff),
                  height: screenHeight * 0.09,
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.donut_small_outlined),
                          onPressed: null),
                      Container(
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.7 + 10,
                        child: TextField(
                          controller: msgTextController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: screenHeight * 0.01,
                                  left: screenWidth * 0.03),
                              hintText: "Type message",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.double_arrow_rounded),
                          onPressed: () {
                            setState(() {
                              messages.add(ChatMessage(
                                messageContent: msgTextController.text,
                                messageType: "sender",
                              ));

                              _chatReference
                                  .child(userChild)
                                  .child(mecareChild)
                                  .push()
                                  .set({
                                'message': msgTextController.text,
                                'author': currentUser,
                              });

                              msgTextController.text = "";
                            });
                          })
                    ],
                  )),
            ),
          ],
        ));
  }

  sendMessage(String msg, String author) {
    return Container(
        padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            top: screenHeight * 0.01,
            bottom: screenHeight * 0.01),
        child: Align(
            alignment: (author == FirebaseAuth.instance.currentUser.uid
                ? Alignment.topRight
                : Alignment.topLeft),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (author == FirebaseAuth.instance.currentUser.uid
                      ? Color(0xff465efc)
                      : Colors.white),
                ),
                padding: EdgeInsets.all(16),
                child: Text(
                  msg,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: author == FirebaseAuth.instance.currentUser.uid
                        ? Colors.white
                        : Color(0xff465efc),
                  ),
                ))));
  }
}
