import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hospital_management/registration/LoginPage.dart';
import 'package:hospital_management/utils/size.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding:
          EdgeInsets.only(left: screenWidth * 0.03, right: screenWidth * 0.03),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.blue[50],
            Colors.blue[100],
            Colors.blue[200],
            Colors.blue[300],
            Colors.blue[400]
          ])),
      child: Form(
        key: _formKey,
        child: Align(
          child: Row(
            children: [
              Container(
                height: screenHeight * 0.08 + 5,
                width: screenWidth * 0.7,
                child: TextFormField(
                  validator: ValidationBuilder().email().build(),
                  controller: emailController,
                ),
              ),
              TextButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailController.text);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                          (route) => false);
                    }
                  },
                  child: Text("Send Email"))
            ],
          ),
        ),
      ),
    ));
  }
}
