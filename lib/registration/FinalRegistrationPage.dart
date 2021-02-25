import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
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
  //Global key
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //TextField Controller
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordControlller = TextEditingController();

  //firebase
  final DatabaseReference _registrationReference =
      FirebaseDatabase.instance.reference().child("registration");
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //variable
  bool userIndatabse;
  bool emailIndatabase;
  bool passwordCheck = false;
  String password;
  String conformPassword;

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    userTextField(
        String hintName,
        String lablename,
        TextEditingController fieldController,
        Function checkFunction,
        bool check,
        String errorMessage,
        String Function(String) validationController) {
      return Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.01),
        child: Container(
          child: TextFormField(
            validator: validationController,
            onChanged: (value) {
              checkFunction(value);
            },
            controller: fieldController,
            decoration: InputDecoration(
                errorText: check == false ? null : errorMessage,
                hintText: hintName,
                labelText: lablename,
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
      );
    }

    passwordfield(String hintName, String lablename,
        TextEditingController fieldController, Function passMatch) {
      return Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.01),
        child: Container(
          child: TextFormField(
            validator: ValidationBuilder().minLength(8).build(),
            controller: fieldController,
            onChanged: (value) {
              passMatch(value);
              setState(() {
                password == conformPassword
                    ? passwordCheck = true
                    : passwordCheck = false;
              });
            },
            decoration: InputDecoration(
                hintText: hintName,
                labelText: lablename,
                errorText: password == conformPassword
                    ? null
                    : "Password Dose Not Match",
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  userTextField(
                      "User Name",
                      "User Name",
                      userNameController,
                      _checkUserInDatabse,
                      userIndatabse,
                      "User name is Used",
                      ValidationBuilder().minLength(6).build()),
                  userTextField(
                      "E-Mail Address",
                      "Email id",
                      emailIdController,
                      _checkEmailInDatabse,
                      emailIndatabase,
                      "Email address is Used",
                      ValidationBuilder().email().build()),
                  passwordfield("********", "Password", passwordController,
                      passwordFunction),
                  passwordfield("********", "Conform Password",
                      conformPasswordControlller, conformPasswordFunction),
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

                        if (_formKey.currentState.validate() &&
                            userIndatabse == false &&
                            emailIndatabase == false &&
                            passwordCheck == true) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.5,
                                        bottom: screenHeight * 0.4,
                                        left: screenWidth * 0.4 + 7,
                                        right: screenWidth * 0.4 + 7),
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3.2,
                                    ));
                              });
                          _registration();
                          _firebaseAuth
                              .createUserWithEmailAndPassword(
                                  email: emailIdController.text,
                                  password: passwordController.text)
                              .then((value) {
                            print(value);
                          });
                          _firebaseAuth
                              .signInWithEmailAndPassword(
                                  email: emailIdController.text,
                                  password: passwordController.text)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PatientDashbord()));
                          });
                        }
                      },
                      child: Text("Complite"),
                    ),
                  ),
                ],
              ),
            ),
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

  _checkEmailInDatabse(String value) {
    _registrationReference
        .orderByChild('email_id')
        .equalTo(value)
        .once()
        .then((value) {
      setState(() {
        value.value == null ? emailIndatabase = false : emailIndatabase = true;
      });
    });
  }

  passwordFunction(String val) {
    setState(() {
      password = val;
    });
  }

  conformPasswordFunction(String val) {
    setState(() {
      conformPassword = val;
    });
  }
}
