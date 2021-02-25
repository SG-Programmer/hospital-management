import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/DashBord.dart';
import 'package:hospital_management/registration/LoginPage.dart';
import 'package:hospital_management/utils/size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'patient/PatientDashbord.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var name;
  @override
  void initState() {
    super.initState();
    _sharepreference();
    _loadScreen();
  }

  _loadScreen() {
    var _duraion = Duration(seconds: 5);
    return Timer(_duraion, navigatScreen);
  }

  void navigatScreen() {
    name == null
        ? Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
            (route) => false)
        : _firebaseAuth
            .signInWithEmailAndPassword(email: name[0], password: name[1])
            .then((value) => name[0] == "admin@mecare.com"
                ? Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashBord(),
                    ),
                    (route) => false)
                : Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientDashbord(),
                    ),
                    (route) => false));
  }

  _sharepreference() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    name = _preferences.getStringList("auth");
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    return Container(
      color: Colors.red,
      child: Center(
        child: MaterialButton(
            child: Text("presss ME"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientDashbord(),
                ),
              );
            }),
      ),
    );
  }
}
