import 'package:flutter/cupertino.dart';

double screenHeight = 0;
double screenWidth = 0;

class ScreenSize {
  static setSize(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
}
