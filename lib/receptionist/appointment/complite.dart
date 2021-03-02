import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/List.dart';
import 'package:hospital_management/utils/size.dart';

import 'appoinmentData.dart';

class Complite extends StatefulWidget {
  @override
  _CompliteState createState() => _CompliteState();
}

class _CompliteState extends State<Complite> {
  //firebase
  DatabaseReference waitingAppoinment =
      FirebaseDatabase.instance.reference().child("appointment");

  DatabaseReference _registration =
      FirebaseDatabase.instance.reference().child("registration");

  List<AppoinmentData> _appoinmentList2 = [];
  List<AppoinmentUserDatail> _appoinmentUserDatail2 = [];

  @override
  void initState() {
    getAppoinmentList();
    super.initState();
  }

  getAppoinmentList() {
    _appoinmentList2.clear();
    _appoinmentUserDatail2.clear();
    waitingAppoinment
        .orderByChild("status")
        .equalTo("book")
        .once()
        .then((DataSnapshot snap) {
      var _key = snap.value.keys;
      var data = snap.value;
      for (var item in _key) {
        AppoinmentData appoinmentData2 = new AppoinmentData(
            data[item]['user_id'],
            data[item]['date'],
            data[item]['time'],
            data[item]['token_no'],
            item);
        _appoinmentList2.add(appoinmentData2);
      }

      _registration.once().then((DataSnapshot snap) {
        var _key = snap.value.keys;
        var _data = snap.value;
        for (var i = 0; i < _appoinmentList2.length; i++) {
          for (var item in _key) {
            if (_appoinmentList2[i].userId == item) {
              AppoinmentUserDatail appoinmentUserDatail =
                  new AppoinmentUserDatail(_data[item]['first_name'],
                      _data[item]['last_name'], _data[item]['number']);
              _appoinmentUserDatail2.add(appoinmentUserDatail);
            }
          }
        }
        setState(() {});
      });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    return listOfCard(_appoinmentList2, _appoinmentUserDatail2);
  }
}
