import 'package:flutter/material.dart';

class Offline extends StatefulWidget {
  @override
  _OfflineState createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                  height: height * 0.6,
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  top: height * 0.01 + 4,
                  left: width * 0.05,
                  right: width * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue[400]),
              child: Padding(
                padding: EdgeInsets.all(height * 0.02),
                child: Row(
                  children: [
                    Icon(
                      Icons.supervised_user_circle,
                      size: height * 0.06,
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Column(
                      children: [
                        Text(
                          "Parth Kevadiya",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500),
                        ),
                        Text("+919955668844"),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: 8),
    );
  }
}
