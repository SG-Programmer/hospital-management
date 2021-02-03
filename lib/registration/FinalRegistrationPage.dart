import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/DashBord.dart';
import 'package:hospital_management/utils/size.dart';

class FinalRegistrationPage extends StatefulWidget {
  @override
  _FinalRegistrationPageState createState() => _FinalRegistrationPageState();
}

class _FinalRegistrationPageState extends State<FinalRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    textfield(String hintName, String lablename) {
      return Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.01),
        child: Container(
          child: TextField(
            decoration: InputDecoration(
                hintText: hintName,
                labelText: lablename,
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          textfield("User Name", "User Name"),
          textfield("E-Mail Address", "Email id"),
          textfield("********", "Password"),
          textfield("********", "Conform Password"),
          SizedBox(
            height: screenHeight * 0.07,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.yellow,
            ),
            height: screenHeight * 0.07,
            width: screenWidth * 0.4,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashBord()));
              },
              child: Text("Complite"),
            ),
          ),
        ],
      ),
    );
  }
}
