import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

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

  slotTime(String timeOfBooking) {
    return Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      height: screenHeight * 0.06,
      width: screenWidth * 0.2 + 5,
      decoration: BoxDecoration(
          color: Colors.white60,
          border: Border.all(),
          borderRadius: BorderRadius.circular(5)),
      child: Text(timeOfBooking),
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
                top: screenHeight * 0.05, left: screenPaddingSide),
            child: Icon(Icons.close_outlined),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenPaddingSide, top: screenHeight * 0.03),
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
                        Text("16 Nov",
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
                    slotTime("08:00"),
                    slotTime("08:30"),
                    slotTime("09:00"),
                    slotTime("09:30")
                  ],
                ),
                Row(
                  children: [
                    slotTime("10:00"),
                    slotTime("10:30"),
                    slotTime("11:00"),
                    slotTime("11:30")
                  ],
                ),
                Row(
                  children: [
                    slotTime("12:00"),
                    slotTime("12:30"),
                    slotTime("01:00"),
                    slotTime("01:30")
                  ],
                ),
                Row(
                  children: [
                    slotTime("02:00"),
                    slotTime("02:30"),
                    slotTime("03:00"),
                    slotTime("03:30")
                  ],
                ),
                Row(
                  children: [
                    slotTime("04:00"),
                    slotTime("04:30"),
                    slotTime("05:00"),
                    slotTime("05:30")
                  ],
                ),
                Row(
                  children: [
                    slotTime("06:00"),
                    slotTime("06:30"),
                    slotTime("07:00"),
                    slotTime("07:30")
                  ],
                ),
                Row(
                  children: [slotTime("08:00"), slotTime("08:30")],
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
                onPressed: null,
                child: Text("Book Appointment"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
