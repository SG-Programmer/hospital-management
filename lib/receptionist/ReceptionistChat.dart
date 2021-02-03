import 'package:flutter/material.dart';
import 'package:hospital_management/Chat.dart';
import 'package:hospital_management/utils/size.dart';

class ReceptionistChat extends StatefulWidget {
  @override
  _ReceptionistChatState createState() => _ReceptionistChatState();
}

class _ReceptionistChatState extends State<ReceptionistChat> {
  List<IconData> profileList = [
    Icons.add_circle_outline,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
  ];
  bool allButtonColor = true;
  bool doctorButtonColor = false;
  bool patientButoonColor = false;
  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.3,
          color: Color(0xff7565f7),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.05, top: screenHeight * 0.09),
          child: Text(
            "Chats",
            style: TextStyle(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.3),
          child: Container(
            padding: EdgeInsets.only(
                top: screenHeight * 0.05, left: screenWidth * 0.06),
            height: screenHeight * 0.8,
            width: double.infinity,
            color: Color(0xffEAEAF1),
            child: ListView.builder(
              itemCount: profileList.length,
              itemBuilder: (BuildContext context, int index) {
                return chat();
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.2 - 27),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(23.0)),
            height: screenHeight * 0.2,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.1 + 25,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: profileList.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: screenWidth * 0.04),
                    itemBuilder: (BuildContext context, int index) {
                      return Icon(profileList[index],
                          size: screenHeight * 0.1 - 7);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.06, top: screenHeight * 0.01),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            allButtonColor = true;
                            doctorButtonColor = false;
                            patientButoonColor = false;
                          });
                        },
                        child: Text(
                          "All",
                          style: TextStyle(
                              fontSize: 19.0,
                              color: allButtonColor
                                  ? Colors.blue
                                  : Colors.black54),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            allButtonColor = false;
                            doctorButtonColor = true;
                            patientButoonColor = false;
                          });
                        },
                        child: Text("Doctor",
                            style: TextStyle(
                                fontSize: 19.0,
                                color: doctorButtonColor
                                    ? Colors.blue
                                    : Colors.black54)),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            allButtonColor = false;
                            doctorButtonColor = false;
                            patientButoonColor = true;
                          });
                        },
                        child: Text("Patient",
                            style: TextStyle(
                                fontSize: 19.0,
                                color: patientButoonColor
                                    ? Colors.blue
                                    : Colors.black54)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
