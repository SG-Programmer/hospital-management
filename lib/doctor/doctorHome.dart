import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/doctor/doctorPatientDetail.dart';
import 'package:hospital_management/utils/size.dart';

class DoctorHome extends StatefulWidget {
  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  //Firebase Databse Reference's
  DatabaseReference _appointment =
      FirebaseDatabase.instance.reference().child('appointment');
  DatabaseReference _onlinePatient =
      FirebaseDatabase.instance.reference().child('registration');
  DatabaseReference _offlinePatinet =
      FirebaseDatabase.instance.reference().child('offlinePatient');

  //Var
  List<Map<String, dynamic>> _appointmentList = [];
  NetworkImage _photo = NetworkImage(
      'https://i.pinimg.com/236x/ed/6c/38/ed6c382b3bf83cba46adb1efec0e49b6.jpg');
  List<String> listOfMenu = ["Medicin", "Symptoms", "Notification"];
  var addlist = ["medicine", "symptoms", "notification"];
  TextEditingController _addController = TextEditingController();
  _showDialoag(String childName) {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text("Add $childName"),
          content: TextField(
            autofocus: true,
            controller: _addController,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  FirebaseDatabase.instance
                      .reference()
                      .child(childName)
                      .push()
                      .set({
                    'name': _addController.text,
                    "date": DateTime.now().day.toString() +
                        "-" +
                        DateTime.now().month.toString() +
                        "-" +
                        DateTime.now().year.toString(),
                  }).then((value) {
                    Navigator.pop(context);
                    _addController.text = "";
                  });
                },
                child: Text("Add"))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromARGB(15, 5, 11, 10),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.03, left: screenWidth * 0.02 + 3),
            child: Text(
              "Patients",
              style: TextStyle(fontSize: 22.3, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: screenHeight * 0.7 - 15,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
              ),
              child: StreamBuilder(
                stream: _appointment.onValue,
                builder: (context, snapshot) {
                  if (snapshot.data == null)
                    return Center(
                      child: Text("Loading..."),
                    );
                  var _data = snapshot.data.snapshot.value;
                  var _keys = snapshot.data.snapshot.value.keys;

                  _onlinePatient.onValue.listen((onlinepatient) {
                    var _onlineData = onlinepatient.snapshot.value;
                    _offlinePatinet.onValue.listen((offlinePatient) {
                      // var _offlineData = offlinePatient.snapshot.value;
                      _appointmentList.clear();
                      for (var key in _keys) {
                        for (var onlineKeys
                            in onlinepatient.snapshot.value.keys) {
                          if (_data[key]['user_id'] == onlineKeys &&
                              _data[key]['status'] == "book") {
                            _appointmentList.add({
                              'first_name': _onlineData[onlineKeys]
                                  ['first_name'],
                              'last_name': _onlineData[onlineKeys]['last_name'],
                              'number': _onlineData[onlineKeys]['number'],
                              'date': _onlineData[onlineKeys]['date'],
                              'user_id': _onlineData[onlineKeys]['user_id'],
                              'user_name': _onlineData[onlineKeys]['user_name'],
                              'gender': _onlineData[onlineKeys]['sex'],
                              'email_id': _onlineData[onlineKeys]['email_id'],
                              'appointmentDtae': _data[key]['date'],
                              'appointmentTime': _data[key]['time']
                            });
                          }
                        }
                      }
                      setState(() {});
                    });
                  });

                  return ListView.builder(
                    itemCount: _appointmentList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorPatientDetail(
                                    _appointmentList[index], _photo),
                              ));
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 8,
                                    color: Colors.black12,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0.1)
                              ]),
                          child: ListTile(
                            title: Text(_appointmentList[index]['first_name'] +
                                " " +
                                _appointmentList[index]['last_name']),
                            subtitle: Text(_appointmentList[index]['number']),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    _appointmentList[index]['appointmentDtae']),
                                Text(_appointmentList[index]['appointmentTime'])
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: screenHeight * 0.01,
                bottom: screenHeight * 0.02,
              ),
              child: ListView.builder(
                itemCount: listOfMenu.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(8),
                  margin: index == 0
                      ? EdgeInsets.only(
                          left: screenWidth * 0.02 + 3,
                        )
                      : EdgeInsets.only(left: screenHeight * 0.02 - 5),
                  width: screenWidth * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            color: Colors.black12,
                            offset: Offset(0, 0),
                            spreadRadius: 0.5)
                      ],
                      borderRadius: BorderRadius.circular(11)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listOfMenu[index],
                        style: TextStyle(
                            fontSize: 16.9,
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showDialoag(addlist[index]);
                        },
                        child: CircleAvatar(
                          radius: 16.0,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.add,
                            color: Colors.yellow[300],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
