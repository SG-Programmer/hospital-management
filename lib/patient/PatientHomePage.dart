import 'package:flutter/material.dart';
import 'package:hospital_management/patient/PatientChat.dart';
import 'package:hospital_management/patient/PatientDoctor.dart';
import 'package:hospital_management/utils/size.dart';

class PatientHomePage extends StatefulWidget {
  @override
  _PatientHomePageState createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage>
    with TickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          controller: controller,
          children: [PatientChat(), PatientDoctor()],
        ),
        bottomNavigationBar: TabBar(
          controller: controller,
          tabs: [
            Icon(
              Icons.message,
              color: Colors.blue,
              size: screenHeight * 0.05,
            ),
            Icon(
              Icons.local_hospital_rounded,
              color: Colors.blue,
              size: screenHeight * 0.05,
            )
          ],
        ));
  }
}
