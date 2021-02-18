import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class PatientProfilePage extends StatefulWidget {
  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  containerOfDatails() {
    return Container(
      margin: EdgeInsets.only(
          top: screenHeight * 0.01,
          left: screenWidth * 0.02,
          right: screenWidth * 0.02),
      padding: EdgeInsets.only(
          left: screenWidth * 0.02,
          right: screenWidth * 0.02,
          top: screenHeight * 0.02,
          bottom: screenHeight * 0.02),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 2)
      ], color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email"),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.01),
            width: double.infinity,
            height: screenHeight * 0.05,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 0),
                  blurRadius: 15,
                  spreadRadius: 0.1),
            ], color: Colors.white, borderRadius: BorderRadius.circular(7)),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(4)),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.4 - 15,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.black26,
                      offset: Offset(0, 0),
                      spreadRadius: 3)
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "  Profile",
                      style: TextStyle(
                          fontSize: 19.8, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.edit_location_outlined,
                          size: 26.5,
                          color: Colors.black,
                        ),
                        onPressed: null)
                  ],
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/photos/portrait-of-a-doctor-picture-id92347287?k=6&m=92347287&s=612x612&w=0&h=URJcB3uKHzlWq42b5UjoA2bd8hPI8B1RLI8ZIpUMsRc='),
                ),
                Divider(
                  color: Colors.black26,
                  thickness: 2.3,
                  height: 29,
                  endIndent: 176,
                  indent: 176,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text("Smit Patel",
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 19)),
                Text("User Interface Designer",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black45)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  containerOfDatails(),
                  containerOfDatails(),
                  containerOfDatails(),
                  containerOfDatails(),
                  containerOfDatails(),
                  containerOfDatails(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
