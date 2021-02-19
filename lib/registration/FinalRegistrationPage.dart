import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/patient/PatientDashbord.dart';

import 'package:hospital_management/utils/size.dart';

class FinalRegistrationPage extends StatefulWidget {
  TextEditingController sexController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  DateTime date;
  String sex;

  FinalRegistrationPage(
      {this.sexController,
      this.firstNameController,
      this.lastNameController,
      this.date,
      this.numberController,
      this.cityController,
      this.pinCodeController,
      this.addressController,
      this.sex});

  @override
  _FinalRegistrationPageState createState() => _FinalRegistrationPageState();
}

class _FinalRegistrationPageState extends State<FinalRegistrationPage> {
  //TextField Controller
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordControlller = TextEditingController();

  //firebase
  final DatabaseReference _registrationReference =
      FirebaseDatabase.instance.reference().child("registration");

  //variable
  bool userIndatabse;

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    userTextField(String hintName, String lablename,
        TextEditingController fieldController) {
      return Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.01),
        child: Container(
          child: TextField(
            onChanged: (value) {
              _checkUserInDatabse(value);
            },
            controller: fieldController,
            decoration: InputDecoration(
                errorText: userIndatabse == false ? null : "User Name is used",
                hintText: hintName,
                labelText: lablename,
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
      );
    }

    userTextField2(String hintName, String lablename,
        TextEditingController fieldController) {
      return Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.01),
        child: Container(
          child: TextField(
            controller: fieldController,
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

    textfield(String hintName, String lablename,
        TextEditingController fieldController) {
      return Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.01),
        child: Container(
          child: TextField(
            controller: fieldController,
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

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              userTextField("User Name", "User Name", userNameController),
              userTextField2("E-Mail Address", "Email id", emailIdController),
              textfield("********", "Password", passwordController),
              textfield(
                  "********", "Conform Password", conformPasswordControlller),
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
                    _registrationReference
                        .child(userNameController.text)
                        .once()
                        .then((value) {
                      setState(() {
                        value.value == null
                            ? userIndatabse = false
                            : userIndatabse = true;
                      });
                    });

                    if (userIndatabse == false) {
                      _registration();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientDashbord()));
                    }
                  },
                  child: Text("Complite"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _registration() {
    _registrationReference.child(userNameController.text).set({
      "user_name": userNameController.text,
      "email_id": emailIdController.text,
      "password": passwordController.text,
      "first_name": widget.firstNameController.text,
      "last_name": widget.lastNameController.text,
      "sex": widget.sex,
      "date": widget.date.toString(),
      "number": widget.numberController.text,
      "city": widget.cityController.text,
      "pin_code": widget.pinCodeController.text,
      "address": widget.addressController.text
    });
  }

  _checkUserInDatabse(String value) {
    _registrationReference.child(value).once().then((value) {
      setState(() {
        value.value == null ? userIndatabse = false : userIndatabse = true;
      });
    });
  }
}
