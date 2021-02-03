import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class Online extends StatefulWidget {
  @override
  _OnlineState createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    String data = "4";
    return data == ""
        ? Center(
            child: Image.asset("images/nodatafound.png"),
          )
        : Container(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black26,
                              offset: Offset(0, 0))
                        ],
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(20.0)),
                    margin: EdgeInsets.only(
                        top: screenHeight * 0.02,
                        left: screenWidth * 0.06,
                        right: screenWidth * 0.06),
                    height: screenHeight * 0.2 - 40,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.02, left: screenWidth * 0.03),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.supervised_user_circle,
                                size: screenHeight * 0.05,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.03),
                                child: Column(
                                  children: [
                                    Text(
                                      "Harsh Shekhadiya",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: screenHeight * 0.01 - 5),
                                    Text(
                                      "+91992266448574",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.01,
                                left: screenWidth * 0.1 + 10),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: screenWidth * 0.03),
                                  width: screenWidth * 0.2 + 19,
                                  height: screenHeight * 0.04 + 7,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.blue[800]),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text("Accept"),
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.2 + 19,
                                  height: screenHeight * 0.04 + 7,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.red[800]),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Decline",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
  }
}
