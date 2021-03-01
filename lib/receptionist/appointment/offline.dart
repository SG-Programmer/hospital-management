import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/appointment/offlinePatientForm.dart';
import 'package:hospital_management/utils/size.dart';

class Offline extends StatefulWidget {
  @override
  _OfflineState createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  Query _query;

  @override
  void initState() {
    _query = FirebaseDatabase.instance.reference().child('offlinePatient');

    super.initState();
  }

  List _name = ['smit007', 'priya05', 'nitin12', 'priya05', 'smit007'];

  Widget _datalist(Map _data) {
    return _name.contains(_data['first_name'])
        ? null
        : Text(_data['first_name']);
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    return Scaffold(
      body: FirebaseAnimatedList(
          query: _query,
          itemBuilder: (BuildContext context, DataSnapshot snap,
              Animation<double> animation, int index) {
            Map _data = snap.value;

            return _datalist(_data);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OfflinePatientForm(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
