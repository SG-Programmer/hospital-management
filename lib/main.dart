import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Registration/LoginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Color(0xff1B34B5)),
    home: LoginPage(),
  ));
}
