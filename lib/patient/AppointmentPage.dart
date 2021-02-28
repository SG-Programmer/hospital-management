import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentPage extends StatefulWidget {
  NetworkImage doctorPhoto;
  String doctorName;
  AppointmentPage({this.doctorPhoto, this.doctorName});
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DatabaseReference _appointment =
      FirebaseDatabase.instance.reference().child('appointment');

  @override
  void initState() {
    super.initState();
    appointmentStatus();
  }

  appointmentStatus() {
    waitingList.clear();
    bookedList.clear();
    _appointment
        .orderByChild('status')
        .equalTo('waiting')
        .once()
        .then((DataSnapshot snap) {
      for (var item in snap.value.keys) {
        waitingList.add(int.parse(item));
      }
    });
    _appointment
        .orderByChild('status')
        .equalTo('book')
        .once()
        .then((DataSnapshot snap) {
      for (var item in snap.value.keys) {
        bookedList.add(int.parse(item));
      }
      setState(() {});
    });
  }

  double screenPaddingSide = screenWidth * 0.04;
  int selectionDateColor = 0;
  bool booked = true;
  bool panding = true;
  int indexOfSloat;
  String time = "";

  List<int> bookedList = [];
  List<int> waitingList = [];

  Color colorSet(int index) {
    Color colorName;
    if (bookedList.contains(index)) {
      colorName = Color(0xffd3a6a6);
    } else if (waitingList.contains(index)) {
      colorName = Color(0Xff97e8dc);
    } else {
      colorName = Colors.white;
    }
    return colorName;
  }

  slotTime(String timeOfBooking, int index) {
    return GestureDetector(
      onTap: bookedList.contains(index) || waitingList.contains(index)
          ? null
          : () {
              setState(() {
                indexOfSloat = index;
                time = timeOfBooking;
              });
            },
      child: Container(
        margin: EdgeInsets.all(9),
        alignment: Alignment.center,
        height: screenHeight * 0.07,
        width: screenWidth * 0.2 - 5,
        decoration: BoxDecoration(
            color: indexOfSloat == index ? Color(0xff0033d9) : colorSet(index),
            border: Border.all(),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          index.toString(),
          style: TextStyle(
              color: indexOfSloat == index ? Colors.white : Colors.black,
              fontWeight:
                  indexOfSloat == index ? FontWeight.w500 : FontWeight.w400,
              fontSize: indexOfSloat == index ? 22 : 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.05, left: screenWidth * 0.9),
            child: IconButton(
                icon: Icon(Icons.close_outlined),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenPaddingSide,
            ),
            child: Row(
              children: [
                Container(
                    height: screenHeight * 0.1 + 30,
                    width: screenWidth * 0.2 + 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image: widget.doctorPhoto, fit: BoxFit.fill),
                    )),
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    widget.doctorName,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text("Heart Repring",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: screenHeight * 0.03 + 5,
                        width: screenWidth * 0.09 + 10,
                        decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("₹ 450",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        width: screenWidth * 0.01,
                      ),
                      Text(
                        "Per Half hour",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ])
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          /*      Container(
            height: screenHeight * 0.1,
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectionDateColor = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: screenPaddingSide),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("12" + "Nov",
                            style: TextStyle(
                              fontSize: selectionDateColor == index ? 22 : 15,
                              fontWeight: FontWeight.w600,
                              color: selectionDateColor == index
                                  ? Colors.blue
                                  : Colors.black38,
                            )),
                        SizedBox(
                          height: screenHeight * 0.01 - 3,
                        ),
                        Text("Friday",
                            style: TextStyle(
                              fontSize: selectionDateColor == index ? 16 : 12,
                              fontWeight: FontWeight.w600,
                              color: selectionDateColor == index
                                  ? Colors.blue
                                  : Colors.black38,
                            )),
                        SizedBox(
                          height: screenHeight * 0.01 - 5,
                        ),
                        Container(
                          height: screenHeight * 0.01 - 5,
                          width: screenWidth * 0.08,
                          color: selectionDateColor == index
                              ? Colors.blue
                              : Colors.black38,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ), */
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.02 + 2, right: screenWidth * 0.02 + 2),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Approx 08:00 to 09:00"),
                    Row(
                      children: [
                        slotTime("08:00 to 09:00", 0),
                        slotTime("08:00 to 09:00", 1),
                        slotTime("08:00 to 09:00", 2),
                        slotTime("08:00 to 09:00", 3)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("08:00 to 09:00", 4),
                        slotTime("08:00 to 09:00", 5),
                        slotTime("08:00 to 09:00", 6),
                        slotTime("08:00 to 09:00", 7)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("08:00 to 09:00", 8),
                        slotTime("08:00 to 09:00", 9),
                        slotTime("09:00 to 10:00", 10),
                        slotTime("09:00 to 10:00", 11)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("09:00 to 10:00", 12),
                        slotTime("09:00 to 10:00", 13),
                        slotTime("09:00 to 10:00", 14),
                        slotTime("09:00 to 10:00", 15)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("09:00 to 10:00", 16),
                        slotTime("09:00 to 10:00", 17),
                        slotTime("09:00 to 10:00", 18),
                        slotTime("09:00 to 10:00", 19)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("06:00 PM", 20),
                        slotTime("06:30 PM", 21),
                        slotTime("07:00 PM", 22),
                        slotTime("07:30 PM", 23)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("08:00 PM", 24),
                        slotTime("08:30 PM", 25),
                        slotTime("09:00 PM", 26)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: screenHeight * 0.06 + 3,
            color: Colors.indigoAccent[700],
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return HeartbeatProgressIndicator(
                          duration: Duration(seconds: 1),
                          startScale: 0,
                          endScale: 2.2,
                          child: Icon(Icons.favorite, color: Colors.red));
                    });
                _appointment.child("$indexOfSloat").set({
                  "user_id": FirebaseAuth.instance.currentUser.uid,
                  "token_no": indexOfSloat,
                  "date": "12/12/2020",
                  "time": time,
                  "status": "waiting"
                }).then((value) {
                  indexOfSloat = null;
                  appointmentStatus();

                  Navigator.pop(context);
                });
              },
              child: Text("Book Appointment",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    );
  }
}
