import 'package:flutter/material.dart';
import 'package:hospital_management/patient/PatientChat.dart';
import 'package:hospital_management/patient/PatientDoctor.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [PatientChat(), PatientDoctor()],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: controller.index,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInToLinear,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          print(index);
          setState(() {
            controller.index = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
