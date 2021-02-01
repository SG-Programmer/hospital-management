import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hospital_management/HomPage.dart';
import 'package:hospital_management/RegistrationStep.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "https://image.freepik.com/free-photo/portrait-female-doctor-with-interns-background_329181-9253.jpg",
                    ))),
            height: height * 0.6,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.06, top: height / 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login to your Account",
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w600,
                        fontSize: 32.0),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "Better Care and Better Understanding.",
                    style: TextStyle(fontSize: 14.0, color: Colors.blue[900]),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.3),
            child: Align(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.white,
                ),
                height: height * 0.5,
                width: width * 0.8,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: height * 0.06,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "E-mail Address",
                            prefixIcon: Icon(Icons.email)),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Password", prefixIcon: Icon(Icons.lock)),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text("Forgot Password ?"),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.pink[900],
                            borderRadius: BorderRadius.circular(12.0)),
                        height: height * 0.06,
                        width: double.infinity,
                        child: RaisedButton(
                          disabledColor: Colors.pink[800],
                          color: Colors.blue[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an Account ?"),
                          GestureDetector(
                              child: Text("Register",
                                  style: TextStyle(
                                    color: Colors.orange,
                                  )),
                              onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegistrationStep(),
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
          Padding(
            padding: EdgeInsets.only(right: 68.0, bottom: height * 0.2),
            child: Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZGF3bnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
