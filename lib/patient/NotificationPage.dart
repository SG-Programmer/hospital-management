import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  DatabaseReference notification =
      FirebaseDatabase.instance.reference().child('notification');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text("Notification"),
          centerTitle: true,
        ),
        body: FirebaseAnimatedList(
          query: notification,
          itemBuilder: (context, snapshot, animation, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: EdgeInsets.all(screenHeight * 0.02),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 0),
                            spreadRadius: 1.5)
                      ]),
                  child: Column(
                    children: [
                      Text(snapshot.value['name'],
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 19.5,
                              fontWeight: FontWeight.w600)),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(snapshot.value['date'],
                              style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w400))),
                    ],
                  )),
            );
          },
        ));
  }
}
