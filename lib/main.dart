import 'package:flutter/material.dart';
import 'Registration/LoginPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Color(0xff1B34B5)),
    home: LoginPage(),
  ));
}
