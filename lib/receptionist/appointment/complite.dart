import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/List.dart';
import 'package:hospital_management/utils/size.dart';

class Complite extends StatefulWidget {
  @override
  _CompliteState createState() => _CompliteState();
}

class _CompliteState extends State<Complite> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    return listOfCard(screenHeight, screenWidth);
  }
}
