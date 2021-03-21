import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class Online extends StatefulWidget {
  @override
  _OnlineState createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
  //firebase
  DatabaseReference waitingAppoinment =
      FirebaseDatabase.instance.reference().child('appointment');

  DatabaseReference _registration =
      FirebaseDatabase.instance.reference().child("registration");
  DatabaseReference appoinmentRecord =
      FirebaseDatabase.instance.reference().child('appointmentRecord');

  String todayDate = DateTime.now().day.toString() +
      "-" +
      DateTime.now().month.toString() +
      "-" +
      DateTime.now().year.toString();

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    return StreamBuilder(
      stream: waitingAppoinment.onValue,
      builder: (context, appoinment) {
        if (appoinment.data == null)
          return Container(
            padding: EdgeInsets.only(
                top: screenHeight * 0.3 - 20,
                bottom: screenHeight * 0.3 - 20,
                left: screenWidth * 0.4 + 8,
                right: screenWidth * 0.4 + 8),
            child: CircularProgressIndicator(),
          );
        return StreamBuilder(
          stream: _registration.onValue,
          builder: (context, patientDatails) {
            if (patientDatails.data == null)
              return Container(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.3 - 20,
                    bottom: screenHeight * 0.3 - 20,
                    left: screenWidth * 0.4 + 8,
                    right: screenWidth * 0.4 + 8),
                child: CircularProgressIndicator(),
              );
            var _appoinmentKeys = appoinment.data.snapshot.value.keys;
            var _appoinmentData = appoinment.data.snapshot.value;
            var _patientKeys = patientDatails.data.snapshot.value.keys;
            var _patientdata = patientDatails.data.snapshot.value;

            List<Map<String, dynamic>> _appoinmentDatails = [];
            for (var _appoinment in _appoinmentKeys) {
              if (_appoinmentData[_appoinment]['status'] == "waiting") {
                for (var _patien in _patientKeys) {
                  if (_patientdata[_patien]['user_id'] ==
                      _appoinmentData[_appoinment]['user_id']) {
                    _appoinmentDatails.add({
                      'token_id': _appoinment,
                      'first_name': _patientdata[_patien]['first_name'],
                      'last_name': _patientdata[_patien]['last_name'],
                      'img': _patientdata[_patien]['img'],
                      'user_id': _patientdata[_patien]['user_id'],
                      'number': _patientdata[_patien]['number'],
                      'token_no': _appoinmentData[_appoinment]['token_no'],
                      'date': _appoinmentData[_appoinment]['date'],
                      'time': _appoinmentData[_appoinment]['time']
                    });
                  }
                }
              }
            }
            return Container(
                child: ListView.builder(
                    itemCount: _appoinmentDatails.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black26,
                                  offset: Offset(0, 0))
                            ],
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(20.0)),
                        margin: EdgeInsets.only(
                            top: screenHeight * 0.02,
                            left: screenWidth * 0.06,
                            right: screenWidth * 0.06),
                        height: screenHeight * 0.2 - 40,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.02,
                              left: screenWidth * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            _appoinmentDatails[index]['img']),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: screenWidth * 0.03),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _appoinmentDatails[index]
                                                      ['first_name'] +
                                                  " " +
                                                  _appoinmentDatails[index]
                                                      ['last_name'],
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                                height:
                                                    screenHeight * 0.01 - 5),
                                            Text(
                                              _appoinmentDatails[index]
                                                  ['number'],
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text("Token Number:-" +
                                      _appoinmentDatails[index]['token_no']
                                          .toString()),
                                  Text("Time:-" +
                                      _appoinmentDatails[index]['time'])
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: screenWidth * 0.03),
                                    width: screenWidth * 0.2 + 19,
                                    height: screenHeight * 0.04 + 7,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.blue[800]),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: TextButton(
                                      onPressed: () {
                                        waitingAppoinment
                                            .child(_appoinmentDatails[index]
                                                ['token_id'])
                                            .update({'status': "book"}).then(
                                                (value) {
                                          appoinmentRecord
                                              .child(todayDate)
                                              .child(_appoinmentDatails[index]
                                                  ['user_id'])
                                              .push()
                                              .set({
                                            'date': _appoinmentDatails[index]
                                                ['date'],
                                            'time': _appoinmentDatails[index]
                                                ['time'],
                                            'token_no':
                                                _appoinmentDatails[index]
                                                    ['token_no'],
                                            'user_id': _appoinmentDatails[index]
                                                ['user_id']
                                          });
                                        });
                                      },
                                      child: Text("Accept"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: screenWidth * 0.03),
                                    width: screenWidth * 0.2 + 19,
                                    height: screenHeight * 0.04 + 7,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        border:
                                            Border.all(color: Colors.red[800]),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: TextButton(
                                      onPressed: () {
                                        waitingAppoinment
                                            .child(_appoinmentDatails[index]
                                                ['token_id'])
                                            .remove();
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }));
          },
        );
      },
    );
  }
}
