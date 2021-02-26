import 'package:flutter/material.dart';
import 'package:hospital_management/patient/PatientAppointment.dart';
import 'package:hospital_management/patient/PatientChat.dart';
import 'package:hospital_management/patient/PatientDoctor.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hospital_management/patient/PatientProfilePage.dart';

class PatientHomePage extends StatefulWidget {
  int controllerIndex;
  PatientHomePage({this.controllerIndex});
  @override
  _PatientHomePageState createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage>
    with TickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    controller.index = widget.controllerIndex;
    super.initState();
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            PatientAppointment(),
            PatientDoctor(),
            PatientChat(),
            PatientProfilePage()
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: controller.index,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.calendar_today_outlined),
            Icon(Icons.perm_identity, size: 30),
            Icon(Icons.message, size: 30),
            Icon(Icons.supervised_user_circle_outlined, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInToLinear,
          animationDuration: Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              controller.index = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
