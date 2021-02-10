import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class PatientAppointment extends StatefulWidget {
  @override
  _PatientAppointmentState createState() => _PatientAppointmentState();
}

class _PatientAppointmentState extends State<PatientAppointment> {
  double screenPaddingSide = screenWidth * 0.04;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.04,
                left: screenPaddingSide,
                right: screenPaddingSide),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                CircleAvatar(
                  child: Icon(Icons.verified_user),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenPaddingSide, top: screenHeight * 0.05),
            child: Text(
              "Appoitment With\na doctor",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                  fontSize: 27),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenPaddingSide,
                top: screenHeight * 0.06,
                right: screenPaddingSide),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                color: Colors.black12,
              ),
              height: screenHeight * 0.06,
              width: screenWidth * 0.9,
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: "Search your symptoms..",
                    prefixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: null),
                    suffixIcon: Icon(
                      Icons.filter_list_outlined,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenPaddingSide, top: screenHeight * 0.05),
            child: Text("How can we help you ?",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 20)),
          ),
          Container(
            height: screenHeight * 0.1 + 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.only(
                        left: screenPaddingSide,
                        top: screenHeight * 0.02,
                        bottom: screenHeight * 0.02),
                    width: screenWidth * 0.2 + 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 0),
                              blurRadius: 5,
                              spreadRadius: 0)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.supervised_user_circle_outlined,
                          color: Colors.blue,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "Home visit",
                        )
                      ],
                    ));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenPaddingSide, top: screenHeight * 0.02),
            child: Text("Popular categories",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
