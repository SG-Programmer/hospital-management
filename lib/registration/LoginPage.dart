import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hospital_management/patient/PatientDashbord.dart';
import 'package:hospital_management/receptionist/DashBord.dart';
import 'package:hospital_management/registration/RegistrationPage.dart';
import 'package:hospital_management/utils/size.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //global key
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  //firebase
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.softLight,
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('images/LoginBackground.jpg'))),
            height: screenHeight * 0.7 - 15,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.06, top: screenHeight * 0.1 + 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login to your Account",
                    style: TextStyle(
                        color: Color(0xffE7EBFE),
                        fontWeight: FontWeight.w600,
                        fontSize: 32.0),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    "Better Care and Better Understanding.",
                    style: TextStyle(fontSize: 14.0, color: Color(0xffE7EBFE)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.3),
            child: Align(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.white,
                ),
                height: screenHeight * 0.5,
                width: screenWidth * 0.8,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.04, right: screenWidth * 0.04),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.06,
                        ),
                        TextFormField(
                          validator: ValidationBuilder().email().build(),
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: "E-mail Address",
                              prefixIcon: Icon(Icons.email)),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        TextFormField(
                          validator: ValidationBuilder().minLength(8).build(),
                          controller: passController,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock)),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              color: Color(0xff272549),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.pink[900],
                              borderRadius: BorderRadius.circular(12.0)),
                          height: screenHeight * 0.06,
                          width: double.infinity,
                          child: RaisedButton(
                            disabledColor: Color(0xff1B34B6),
                            color: Color(0xff1B34B6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
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
                                _firebaseAuth
                                    .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passController.text)
                                    .then((value) {
                                  emailController.text == "admin"
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DashBord(),
                                          ))
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Scaffold(
                                              resizeToAvoidBottomPadding: false,
                                              body: PatientDashbord(),
                                            ),
                                          ));

                                  emailController.text = "";
                                  passController.text = "";
                                }).catchError((e) {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    child: AlertDialog(
                                        elevation: 5.5,
                                        actionsPadding: EdgeInsets.all(12),
                                        actions: [
                                          GestureDetector(
                                            child: Text(
                                              "cancel",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          SizedBox(width: screenWidth * 0.01),
                                          GestureDetector(
                                            child: Text("ok",
                                                style: TextStyle(fontSize: 16)),
                                            onTap: () {
                                              Navigator.pop(context);
                                              emailController.text = "";
                                              passController.text = "";
                                            },
                                          )
                                        ],
                                        title: Text("Failed"),
                                        content: Text(
                                            "Wrong Email_id and Password plz try again..!")),
                                  );
                                });
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an Account ?"),
                            GestureDetector(
                                child: Text("Register",
                                    style: TextStyle(
                                        color: Color(0xffFF7f2D),
                                        fontWeight: FontWeight.w600)),
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationPage(),
                                      ),
                                    ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 68.0, bottom: screenHeight * 0.2),
            child: Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                  radius: 60, backgroundImage: AssetImage('images/mecare.png')),
            ),
          ),
        ],
      ),
    );
  }
}
