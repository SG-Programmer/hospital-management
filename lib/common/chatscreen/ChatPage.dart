import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/PatientDatails.dart';
import 'package:hospital_management/utils/size.dart';
import 'chatDetailPage.dart';

class ChatPage extends StatefulWidget {
  NetworkImage profilePhoto;
  var datails;
  ChatPage(this.datails, this.profilePhoto);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController msgTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.datails.userNameP),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientDatails(
                        datails: widget.datails,
                      ),
                    ));
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
              color: Color(0xfff5f6f1),
              height: screenHeight * 0.8,
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return sendMessage(messages[index].messageContent,
                      messages[index].messageType);
                },
              ),
            ),
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
                              msgTextController.text = "";
                            });
                          })
                    ],
                  )),
            ),
          ],
        ));
  }

  sendMessage(String msg, String msgType) {
    return Container(
        padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            top: screenHeight * 0.01,
            bottom: screenHeight * 0.01),
        child: Align(
            alignment: (msgType == "receiver"
                ? Alignment.topLeft
                : Alignment.topRight),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (msgType == "receiver"
                      ? Colors.white
                      : Color(0xff465efc)),
                ),
                padding: EdgeInsets.all(16),
                child: Text(
                  msg,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: msgType == "receiver"
                        ? Color(0xff465efc)
                        : Colors.white,
                  ),
                ))));
  }
}
