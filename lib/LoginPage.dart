import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white70,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: height * 0.6,
            width: double.infinity,
            color: Colors.pink[400],
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.06, top: height * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login to your Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 32.0),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "Better Care and Better Understanding.",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
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
                        decoration: InputDecoration(hintText: "E-mail Address"),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "Password"),
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          onPressed: null,
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
                          Text("Register",
                              style: TextStyle(
                                color: Colors.orange,
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
              child: Container(
                height: height * 0.15,
                width: width * 0.30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          color: Colors.black54,
                          offset: Offset(0, 5),
                          spreadRadius: 0.01)
                    ]),
                child: Icon(
                  Icons.local_hospital,
                  size: 60.0,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
