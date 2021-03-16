import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/patient/AppointmentPage.dart';
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

  Widget _datalist(Map _data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppointmentPage(
                doctorName: "Dr.Jatina patel",
                offlineUserId: _data['user_id'],
              ),
            ));
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            top: screenHeight * 0.02),
        child: Container(
          height: screenHeight * 0.09 + 14,
          width: double.infinity,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.6),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    offset: Offset(0, 3),
                    color: Colors.black26,
                    spreadRadius: 3.1)
              ]),
          child: Row(
            children: [
              SizedBox(
                width: screenWidth * 0.03,
              ),
              CircleAvatar(
                child: Icon(Icons.supervised_user_circle_outlined),
                radius: 33,
              ),
              SizedBox(
                width: screenWidth * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _data['first_name'] + " " + _data['last_name'],
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01 - 5,
                  ),
                  Text(
                    _data['number'],
                    style: TextStyle(
                        fontSize: 15.2,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    return Scaffold(
      body: Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: screenWidth * 0.04,
          //       right: screenWidth * 0.04,
          //       top: screenHeight * 0.01),
          //   child: Container(
          //     height: screenHeight * 0.06,
          //     width: double.infinity,
          //     child: TextField(
          //       onChanged: (value) {},
          //       decoration: InputDecoration(
          //           suffixIcon: IconButton(
          //               icon: Icon(
          //                 Icons.search,
          //                 size: 31,
          //               ),
          //               onPressed: () {})),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Container(
              child: FirebaseAnimatedList(
                  query: _query,
                  itemBuilder: (BuildContext context, DataSnapshot snap,
                      Animation<double> animation, int index) {
                    Map _data = snap.value;

                    return _datalist(_data);
                  }),
            ),
          ),
        ],
      ),
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
