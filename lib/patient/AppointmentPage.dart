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
  double screenPaddingSide = screenWidth * 0.04;
  int selectionDateColor = 0;
  bool booked = true;
  bool panding = true;
  int indexOfSloat = 0;

  List<int> bookedList = [0, 5, 9, 13, 24];
  List<int> waitingList = [1, 2, 3, 11, 20];

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
              });
            },
      child: Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        height: screenHeight * 0.06,
        width: screenWidth * 0.2 + 5,
        decoration: BoxDecoration(
            color: indexOfSloat == index ? Color(0xff0033d9) : colorSet(index),
            border: Border.all(),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          timeOfBooking,
          style: TextStyle(
              color: indexOfSloat == index ? Colors.white : Colors.black,
              fontWeight:
                  indexOfSloat == index ? FontWeight.w500 : FontWeight.w400),
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
          Container(
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
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.02 + 2),
            child: Column(
              children: [
                Row(
                  children: [
                    slotTime("08:00 AM", 0),
                    slotTime("08:30 AM", 1),
                    slotTime("09:00 AM", 2),
                    slotTime("09:30 AM", 3)
                  ],
                ),
                Row(
                  children: [
                    slotTime("10:00 AM", 4),
                    slotTime("10:30 AM", 5),
                    slotTime("11:00 AM", 6),
                    slotTime("11:30 AM", 7)
                  ],
                ),
                Row(
                  children: [
                    slotTime("12:00 PM", 8),
                    slotTime("12:30 PM", 9),
                    slotTime("01:00 PM", 10),
                    slotTime("01:30 PM", 11)
                  ],
                ),
                Row(
                  children: [
                    slotTime("02:00 PM", 12),
                    slotTime("02:30 PM", 13),
                    slotTime("03:00 PM", 14),
                    slotTime("03:30 PM", 15)
                  ],
                ),
                Row(
                  children: [
                    slotTime("04:00 PM", 16),
                    slotTime("04:30 PM", 17),
                    slotTime("05:00 PM", 18),
                    slotTime("05:30 PM", 19)
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
                    slotTime("08:30 PM", 25)
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenPaddingSide, right: screenPaddingSide),
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.06 + 3,
              decoration: BoxDecoration(
                color: Colors.indigoAccent[700],
                borderRadius: BorderRadius.circular(5),
              ),
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
                },
                child: Text("Book Appointment",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
