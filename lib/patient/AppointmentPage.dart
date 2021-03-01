import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';
import 'package:progress_indicators/progress_indicators.dart';

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
                      // image: DecorationImage(
                      //     image: widget.doctorPhoto, fit: BoxFit.fill),
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
                    Text("Approx 10:00 to 11:00"),
                    Row(
                      children: [
                        slotTime("10:00 to 11:00", 1),
                        slotTime("10:00 to 11:00", 2),
                        slotTime("10:00 to 11:00", 3),
                        slotTime("10:00 to 11:00", 4)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("08:00 to 09:00", 5),
                        slotTime("08:00 to 09:00", 6),
                        slotTime("08:00 to 09:00", 7),
                        slotTime("08:00 to 09:00", 8)
                      ],
                    ),
                    Text("Approx 11:00 to 12:00"),
                    Row(
                      children: [
                        slotTime("11:00 to 12:00", 9),
                        slotTime("11:00 to 12:00", 10),
                        slotTime("11:00 to 12:00", 11),
                        slotTime("11:00 to 12:00", 12)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("11:00 to 12:00", 13),
                        slotTime("11:00 to 12:00", 14),
                        slotTime("11:00 to 12:00", 15),
                        slotTime("11:00 to 12:00", 16)
                      ],
                    ),
                    Text("Approx 12:00 to 01:00"),
                    Row(
                      children: [
                        slotTime("12:00 to 01:00", 17),
                        slotTime("12:00 to 01:00", 18),
                        slotTime("12:00 to 01:00", 19),
                        slotTime("12:00 to 01:00", 20)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("12:00 to 01:00", 21),
                        slotTime("12:00 to 01:00", 22),
                        slotTime("12:00 to 01:00", 23),
                        slotTime("12:00 to 01:00", 24)
                      ],
                    ),
                    Text("Approx 02:00 to 03:00"),
                    Row(
                      children: [
                        slotTime("02:00 to 03:00", 25),
                        slotTime("02:00 to 03:00", 26),
                        slotTime("02:00 to 03:00", 27),
                        slotTime("02:00 to 03:00", 28)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("02:00 to 03:00", 29),
                        slotTime("02:00 to 03:00", 30),
                        slotTime("02:00 to 03:00", 31),
                        slotTime("02:00 to 03:00", 32)
                      ],
                    ),
                    Text("Approx 03:00 to 04:00"),
                    Row(
                      children: [
                        slotTime("03:00 to 04:00", 33),
                        slotTime("03:00 to 04:00", 34),
                        slotTime("03:00 to 04:00", 35),
                        slotTime("03:00 to 04:00", 36)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("03:00 to 04:00", 37),
                        slotTime("03:00 to 04:00", 38),
                        slotTime("03:00 to 04:00", 39),
                        slotTime("03:00 to 04:00", 40)
                      ],
                    ),
                    Text("Approx 04:00 to 05:00"),
                    Row(
                      children: [
                        slotTime("04:00 to 05:00", 41),
                        slotTime("04:00 to 05:00", 42),
                        slotTime("04:00 to 05:00", 43),
                        slotTime("04:00 to 05:00", 44)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("04:00 to 05:00", 45),
                        slotTime("04:00 to 05:00", 46),
                        slotTime("04:00 to 05:00", 47),
                        slotTime("04:00 to 05:00", 48)
                      ],
                    ),
                    Text("Approx 05:00 to 06:00"),
                    Row(
                      children: [
                        slotTime("05:00 to 06:00", 49),
                        slotTime("05:00 to 06:00", 50),
                        slotTime("05:00 to 06:00", 51),
                        slotTime("05:00 to 06:00", 52)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("05:00 to 06:00", 53),
                        slotTime("05:00 to 06:00", 54),
                        slotTime("05:00 to 06:00", 55),
                        slotTime("05:00 to 06:00", 56)
                      ],
                    ),
                    Text("Approx 06:00 to 07:00"),
                    Row(
                      children: [
                        slotTime("06:00 to 07:00", 57),
                        slotTime("06:00 to 07:00", 58),
                        slotTime("06:00 to 07:00", 59),
                        slotTime("06:00 to 07:00", 60)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("06:00 to 07:00", 61),
                        slotTime("06:00 to 07:00", 62),
                        slotTime("06:00 to 07:00", 63),
                        slotTime("06:00 to 07:00", 64)
                      ],
                    ),
                    Text("Approx 07:00 to 08:00"),
                    Row(
                      children: [
                        slotTime("07:00 to 08:00", 65),
                        slotTime("07:00 to 08:00", 66),
                        slotTime("07:00 to 08:00", 67),
                        slotTime("07:00 to 08:00", 68)
                      ],
                    ),
                    Row(
                      children: [
                        slotTime("07:00 to 08:00", 69),
                        slotTime("07:00 to 08:00", 60),
                        slotTime("07:00 to 08:00", 61),
                        slotTime("07:00 to 08:00", 62)
                      ],
                    ),
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
