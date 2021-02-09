import 'package:flutter/material.dart';
import 'package:hospital_management/patient/PatientChat.dart';

class PatientHomePage extends StatefulWidget {
  @override
  _PatientHomePageState createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage>
    with TickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          controller: controller,
          children: [PatientChat()],
        ),
        bottomNavigationBar: TabBar(
          controller: controller,
          tabs: [Icon(Icons.verified_user)],
        ));
  }
}
