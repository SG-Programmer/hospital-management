import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_management/splashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Color(0xff1B34B5)),
    home: SplashScreen(),
  ));
}
