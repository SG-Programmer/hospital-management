import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

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

  var onlinePatinetKey;
  var offlinePatientKey;

  var onlinePatientData;
  var offlinePatientData;

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    return StreamBuilder(
        stream: waitingAppoinment.onValue,
        builder: (context, snapshot) {
          _registration.onValue.listen((onlinePatientDetails) {
            onlinePatinetKey = onlinePatientDetails.snapshot.value.keys;
            onlinePatientData = onlinePatientDetails.snapshot.value;
          });
          _offlineUser.onValue.listen((offlinePatientDetails) {
            offlinePatientKey = offlinePatientDetails.snapshot.value.keys;
            offlinePatientData = offlinePatientDetails.snapshot.value;
          });
          List<Map<String, dynamic>> bookList = [];
          if (snapshot.data == null ||
              onlinePatientData == null ||
              onlinePatientData == null)
            return Container(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.3 - 20,
                  bottom: screenHeight * 0.3 - 20,
                  left: screenWidth * 0.4 + 8,
                  right: screenWidth * 0.4 + 8),
              child: CircularProgressIndicator(),
            );

          if (snapshot.data != null &&
              onlinePatientData != null &&
              offlinePatientData != null) {
            var appoinmentKey = snapshot.data.snapshot.value.keys;
            var appoinmentdata = snapshot.data.snapshot.value;
            for (var aKey in appoinmentKey) {
              if (appoinmentdata[aKey]['status'] == "book") {
                for (var onKey in onlinePatinetKey) {
                  if (appoinmentdata[aKey]['user_id'] ==
                      onlinePatientData[onKey]['user_id']) {
                    bookList.add({
                      "name": onlinePatientData[onKey]['first_name'] +
                          " " +
                          onlinePatientData[onKey]['last_name'],
                      "number": onlinePatientData[onKey]['number'],
                      "time": appoinmentdata[aKey]['time'],
                      'token_no': appoinmentdata[aKey]['token_no'],
                    });
                  }
                }
                for (var offKey in offlinePatientKey) {
                  if (offlinePatientData[offKey]['user_id'] ==
                      appoinmentdata[aKey]['user_id']) {
                    bookList.add({
                      "name": offlinePatientData[offKey]['first_name'] +
                          " " +
                          offlinePatientData[offKey]['last_name'],
                      "number": offlinePatientData[offKey]['number'],
                      "time": appoinmentdata[aKey]['time'],
                      'token_no': appoinmentdata[aKey]['token_no'],
                    });
                  }
                }
              }
            }
          }

          return ListView.builder(
            itemCount: bookList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => PatientDatails(
                  //         userName: _appoinmentUserDatail[index].userNameP ??
                  //             _appoinmentUserDatail[index].firstNameP,
                  //         firstName: _appoinmentUserDatail[index].firstNameP,
                  //         lastName: _appoinmentUserDatail[index].lastNameP,
                  //         email: _appoinmentUserDatail[index].emailP ?? "Null",
                  //         number: _appoinmentUserDatail[index].numberP,
                  //         date: _appoinmentUserDatail[index].brithDateP,
                  //         address: _appoinmentUserDatail[index].addressP,
                  //       ),
                  //     ));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: screenHeight * 0.01 + 4,
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue[400]),
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.supervised_user_circle,
                              size: screenHeight * 0.06,
                            ),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bookList[index]['name'],
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(bookList[index]['number']),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Time:-" + bookList[index]['time']),
                            Text("Token No:-" +
                                bookList[index]['token_no'].toString())
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
