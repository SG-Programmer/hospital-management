import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/List.dart';
import 'package:hospital_management/receptionist/PatientListData.dart';
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

  DatabaseReference _offlineUser =
      FirebaseDatabase.instance.reference().child("offlinePatient");

  List<AppoinmentData> _appoinmentList = [];
  List<PatientListData> _appoinmentUserDatail = [];

  @override
  void initState() {
    getAppoinmentList();

    super.initState();
  }

  getAppoinmentList() {
    List<AppoinmentData> _appoinmentList2 = [];
    List<PatientListData> _appoinmentUserDatail2 = [];
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
        _offlineUser.once().then((DataSnapshot snap2) {
          var _key2 = snap2.value.keys;
          var _data2 = snap2.value;
          for (var i = 0; i < _appoinmentList2.length; i++) {
            for (var item in _key) {
              if (_appoinmentList2[i].userId == item) {
                PatientListData appoinmentUserDatail = new PatientListData(
                    _data[item]['first_name'],
                    _data[item]['last_name'],
                    _data[item]['user_name'],
                    _data[item]['email_id'],
                    _data[item]['number'],
                    _data[item]['address'],
                    _data[item]['date'],
                    _data[item]['user_id']);
                _appoinmentUserDatail2.add(appoinmentUserDatail);
              }
              for (var item2 in _key2) {
                if (_appoinmentList2[i].userId == item2) {
                  PatientListData appoinmentUserDatail2 = new PatientListData(
                      _data2[item2]['first_name'],
                      _data2[item2]['last_name'],
                      _data2[item2]['user_name'],
                      _data2[item2]['email_id'],
                      _data2[item2]['number'],
                      _data2[item2]['address'],
                      _data2[item2]['date'],
                      _data[item]['user_id']);
                  _appoinmentUserDatail2.add(appoinmentUserDatail2);
                }
              }
            }
            setState(() {
              _appoinmentList = _appoinmentList2;
              _appoinmentUserDatail = _appoinmentUserDatail2;
            });
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    if (_appoinmentList.length == 0 && _appoinmentUserDatail.length == 0)
      return Container(
        padding: EdgeInsets.only(
            top: screenHeight * 0.3 - 20,
            bottom: screenHeight * 0.3 - 20,
            left: screenWidth * 0.4 + 8,
            right: screenWidth * 0.4 + 8),
        child: CircularProgressIndicator(),
      );
    return listOfCard(_appoinmentList, _appoinmentUserDatail);
  }
}
