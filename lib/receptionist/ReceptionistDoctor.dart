import 'package:flutter/material.dart';
import 'package:hospital_management/common/doctorscreen/DoctorList.dart';

class ReceptionistDoctor extends StatefulWidget {
  @override
  _ReceptionistDoctorState createState() => _ReceptionistDoctorState();
}

class _ReceptionistDoctorState extends State<ReceptionistDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoctorList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
