import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/doctor/doctorAppoinment.dart';
import 'package:hospital_management/doctor/doctorMedicine.dart';
import 'package:hospital_management/utils/size.dart';

class DoctorPatientDetail extends StatefulWidget {
  var _photo;
  var _datailList;
  DoctorPatientDetail(this._datailList, this._photo);
  @override
  _DoctorPatientDetailState createState() => _DoctorPatientDetailState();
}

class _DoctorPatientDetailState extends State<DoctorPatientDetail> {
  DatabaseReference medicale =
      FirebaseDatabase.instance.reference().child('medicale_detail');
  TextEditingController _controller = TextEditingController();
  _textDatails(String titleName, String firstName) {
    return GestureDetector(
      onTap: () {
        if (titleName == "Age" ||
            titleName == "Height" ||
            titleName == "Weight" ||
            titleName == "Blud Group" ||
            titleName == "Blud Pressure") {
          showDialog(
              context: context,
              child: AlertDialog(
                title: Text("Enter Patient $titleName"),
                content: TextField(
                  autofocus: true,
                  controller: _controller,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        medicale.child(widget._datailList['user_id']).update(
                            {titleName: _controller.text}).then((value) {
                          Navigator.pop(context);
                          _controller.text = "";
                        });
                      },
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.blue, fontSize: 17.3),
                      ))
                ],
              ));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleName,
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: screenHeight * 0.01 - 5,
          ),
          Text(firstName,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.3))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.purple[50],
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: screenHeight * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.purple[200],
                  Colors.purple[300],
                  Colors.purple[400],
                  Colors.purple[500],
                  Colors.purple[600],
                ])),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () => Navigator.pop(context)),
                  Text(
                    "Patient Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.9,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.2,
                left: screenWidth * 0.03,
                right: screenWidth * 0.03),
            child: Container(
              height: screenHeight * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.08,
                    left: screenWidth * 0.06,
                    right: screenWidth * 0.09),
                child: Row(
                  children: [
                    Container(
                      width: screenWidth * 0.5 - 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _textDatails(
                              "First Name", widget._datailList['first_name']),
                          _textDatails("Email", widget._datailList['email_id']),
                          _textDatails("Blud Pressure", "120.6"),
                          _textDatails("Height", "5.6"),
                          _textDatails("Blud Group", "B+"),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _textDatails(
                              "Last Name", widget._datailList['last_name']),
                          _textDatails(
                              "Mobile Number", widget._datailList['number']),
                          _textDatails("Age", "19"),
                          _textDatails("Weight", "51.5"),
                          _textDatails(
                              "Gender",
                              widget._datailList['gender'] == "Mr"
                                  ? "Men"
                                  : "Women")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.1 + 26,
                left: screenWidth * 0.4 - 12,
                right: screenWidth * 0.05),
            child: CircleAvatar(
              radius: 54,
              backgroundImage: widget._photo,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: screenHeight * 0.02,
                left: screenWidth * 0.03,
                right: screenWidth * 0.03),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: screenHeight * 0.2 + 28,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorAppoinment(
                                    widget._datailList['user_id']),
                              ));
                        },
                        child: Container(
                          height: screenHeight * 0.09,
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.black12,
                                    offset: Offset(0, 0),
                                    spreadRadius: 1)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.05,
                                  ),
                                  Card(
                                    child: Icon(Icons.calendar_today,
                                        color: Colors.blue[900]),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.02,
                                  ),
                                  Text("Appoinment",
                                      style: TextStyle(
                                          fontSize: 14.9,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue[800])),
                                ],
                              ),
                              IconButton(
                                  icon: Icon(Icons.arrow_forward_ios_rounded,
                                      color: Colors.blue[500]),
                                  onPressed: null)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorMedicine(
                                    widget._datailList['user_id']),
                              ));
                        },
                        child: Container(
                          height: screenHeight * 0.09,
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.black12,
                                    offset: Offset(0, 0),
                                    spreadRadius: 1)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                SizedBox(
                                  width: screenWidth * 0.05,
                                ),
                                Card(
                                  child: Icon(Icons.calendar_today,
                                      color: Colors.blue[900]),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.02,
                                ),
                                Text("Medicine",
                                    style: TextStyle(
                                        fontSize: 14.9,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue[800])),
                              ]),
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.blue[500],
                                  ),
                                  onPressed: null)
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
