import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  TabController controller;
  RegistrationPage({this.controller});
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
/*     TextEditingController name = TextEditingController(); */

    textfield(String hintName) {
      return Padding(
        padding: EdgeInsets.only(top: height * 0.01),
        child: Container(
          child: TextField(
            decoration: InputDecoration(hintText: hintName),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Basic information",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width / 8,
                child: textfield("Mr"),
              ),
              Container(
                width: width / 2.6,
                child: textfield("Last Name"),
              ),
              Container(
                width: width / 2.6,
                child: textfield("Last Name"),
              ),
            ],
          ),
          textfield("BirthDay"),
          textfield("Mobile no"),
          textfield("City"),
          textfield("PinCode"),
          textfield("Address"),
          SizedBox(
            height: height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.yellow,
                ),
                height: height * 0.07,
                width: width * 0.4,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  onPressed: () {
                    widget.controller.index = 1;
                  },
                  child: Text("Continue"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
