import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/PatientDatails.dart';
import 'package:hospital_management/receptionist/PatientList.dart';

class ReceptionistPatient extends StatefulWidget {
  @override
  _ReceptionistPatientState createState() => _ReceptionistPatientState();
}

class _ReceptionistPatientState extends State<ReceptionistPatient>
    with TickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      children: [
        PatientList(controller: controller),
        PatientDatails(controller: controller)
      ],
    );
  }
}
