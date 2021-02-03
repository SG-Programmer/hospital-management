import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class RegistrationPage extends StatefulWidget {
  TabController controller;
  RegistrationPage({this.controller});
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  DateTime date = DateTime.now();
  selectDate(BuildContext context) async {
    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2022));
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

/*     TextEditingController name = TextEditingController(); */

    textfield(String hintName, String labeltext, [Icon iconname]) {
      return Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.01),
        child: Container(
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintName,
              labelText: labeltext,
              prefixIcon: iconname,
            ),
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
                width: screenWidth / 8,
                child: textfield(
                  "Mr",
                  "Mr",
                ),
              ),
              Container(
                width: screenWidth / 2.6,
                child: textfield("Last Name", "First Name"),
              ),
              Container(
                width: screenWidth / 2.6,
                child: textfield("Last Name", "Last Name"),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Container(
            height: screenHeight * 0.09,
            padding: EdgeInsets.only(left: screenWidth * 0.03),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0), border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    Text(date.day.toString() +
                        "/" +
                        date.month.toString() +
                        "/" +
                        date.year.toString())
                  ],
                ),
                TextButton(
                    onPressed: () {
                      selectDate(context);
                    },
                    child: Text("Select Date"))
              ],
            ),
          ),
          textfield("Mobile no", "Number", Icon(Icons.confirmation_number)),
          textfield("City", "City", Icon(Icons.location_city)),
          textfield("PinCode", "PinCode", Icon(Icons.code)),
          textfield("Address", "Address", Icon(Icons.location_city)),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
