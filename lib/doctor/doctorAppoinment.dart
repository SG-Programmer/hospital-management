import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';
import 'package:timeline/model/timeline_model.dart';
import 'package:timeline/timeline.dart';

class DoctorAppoinment extends StatefulWidget {
  String user_id;
  DoctorAppoinment(this.user_id);
  @override
  _DoctorAppoinmentState createState() => _DoctorAppoinmentState();
}

class _DoctorAppoinmentState extends State<DoctorAppoinment> {
  DatabaseReference _appointmentrecord =
      FirebaseDatabase.instance.reference().child('appointmentRecord');
  NetworkImage _loading;
  @override
  void initState() {
    _loading = NetworkImage('https://www.pordata.pt/en/img/Waiting.gif?12543');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Appointment Details"),
      ),
      body: StreamBuilder(
          stream: _appointmentrecord.onValue,
          builder: (context, appointmentrecord) {
            if (appointmentrecord.data == null)
              return Center(
                child: Image(
                  height: screenHeight * 0.2,
                  image: _loading,
                ),
              );
            List<Map<dynamic, dynamic>> _record = [];

            var _data = appointmentrecord.data.snapshot.value;
            var _dateList = appointmentrecord.data.snapshot.value.keys;
            var _user = widget.user_id;

            for (var item in _dateList) {
              for (var user in _data[item].keys) {
                if (user == _user) {
                  for (var item2 in _data[item][_user].keys) {
                    _record.add(_data[item][_user][item2]);
                  }
                }
              }
            }

            if (_record.length <= 0) {
              return Center(
                child: Image(
                    image: NetworkImage(
                        'https://www.beuphoric.com/assets_ui/images/no-record-found.png')),
              );
            } else {
              return TimelineComponent(
                timelineList: [
                  for (var item in _record)
                    TimelineModel(
                        id: "1",
                        title: item['date'] + "-" + item['time'],
                        description:
                            "Token Number:- " + item['token_no'].toString()),
                ],
              );
            }
          }),
    );
  }
}
