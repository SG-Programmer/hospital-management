import 'package:flutter/material.dart';
import 'package:hospital_management/common/doctorscreen/DoctorList.dart';

class DoctorDatailPage extends StatefulWidget {
  @override
  _DoctorDatailPageState createState() => _DoctorDatailPageState();
}

class _DoctorDatailPageState extends State<DoctorDatailPage> {
  @override
  Widget build(BuildContext context) {
    return DoctorList();
  }
}
