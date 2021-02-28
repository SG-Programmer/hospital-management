import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/PatientList.dart';

class ReceptionistPatient extends StatefulWidget {
  @override
  _ReceptionistPatientState createState() => _ReceptionistPatientState();
}

class _ReceptionistPatientState extends State<ReceptionistPatient> {
  @override
  Widget build(BuildContext context) {
    return PatientList();
  }
}
