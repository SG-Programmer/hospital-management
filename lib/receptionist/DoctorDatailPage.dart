import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class DoctorDatailPage extends StatefulWidget {
  @override
  _DoctorDatailPageState createState() => _DoctorDatailPageState();
}

class _DoctorDatailPageState extends State<DoctorDatailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: screenHeight * 0.3 + 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/doctorProfile.png'),
                  fit: BoxFit.fill)),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.3 + 10),
          child: Container(
            height: screenHeight * 0.7,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.04, left: screenWidth * 0.05),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 34.0,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5KVsWtDwcdLRc9q1P9N8leBy_zz9gfKZK1Q&usqp=CAU'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.03),
                            child: Text("Dr.Parth Patel",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.03),
                            child: Text("Heart Surgeon-Flower Hospitel's",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.call),
                                onPressed: null,
                                color: Colors.blue[800],
                                disabledColor: Colors.blue[800],
                              ),
                              IconButton(
                                icon: Icon(Icons.message),
                                onPressed: null,
                                color: Colors.orange[400],
                                disabledColor: Colors.orange[400],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05, top: screenHeight * 0.02),
                  child: Text(
                    "About Doctor",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05, top: screenHeight * 0.02 - 4),
                  child: Text(
                    "Doctors That Work Within a Community They are the frontline and first point of contact in a patient's health care. They diagnose and treat their patients for all sorts of ailments, and also refer their patients to the appropriate specialist doctor when needed for specific medical opinions and advice.",
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        height: 1.4),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
