import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class PatientDatails extends StatefulWidget {
  String userName, firstName, lastName, email, number, date, address;
  PatientDatails(
      {this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.number,
      this.date,
      this.address});
  @override
  _PatientDatailsState createState() => _PatientDatailsState();
}

class _PatientDatailsState extends State<PatientDatails> {
  datailsLable(String lableName, String profileData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lableName,
            style:
                TextStyle(color: Colors.black38, fontWeight: FontWeight.w400)),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Text(
          profileData,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        Divider(
          color: Colors.black54,
        ),
        SizedBox(height: screenHeight * 0.02)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Datails"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: screenHeight * 0.04),
            height: screenHeight * 0.3 - 41,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white70, boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black26,
                offset: Offset(0, 0),
              )
            ]),
            child: Column(
              children: [
                Icon(
                  Icons.supervised_user_circle_outlined,
                  size: 69.0,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  widget.userName,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                ),
                Text("28 year's young")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.03, top: screenHeight * 0.03),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      datailsLable("First Name", widget.firstName),
                      SizedBox(
                        width: screenWidth * 0.3,
                      ),
                      datailsLable("First Name", widget.lastName),
                    ],
                  ),
                  datailsLable("email", widget.email),
                  datailsLable("Mobile", widget.number),
                  datailsLable("Date of Brith", widget.date),
                  datailsLable("Address", widget.address),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
