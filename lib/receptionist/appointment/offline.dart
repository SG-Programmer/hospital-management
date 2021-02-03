import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/List.dart';
import 'package:hospital_management/utils/size.dart';

class Offline extends StatefulWidget {
  @override
  _OfflineState createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0))),
                backgroundColor: Colors.blue[300],
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: screenHeight * 0.6,
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        body: listOfCard(screenHeight, screenWidth));
  }
}