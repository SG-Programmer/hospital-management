import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class DoctorDatailPage extends StatefulWidget {
  @override
  _DoctorDatailPageState createState() => _DoctorDatailPageState();
}

class _DoctorDatailPageState extends State<DoctorDatailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: screenHeight * 0.3 + 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/doctorProfile.png'),
                  fit: BoxFit.fill)),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.03,
          ),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context)),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.3 + 10),
          child: Container(
            height: screenHeight * 0.7,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: screenHeight * 0.04, left: screenWidth * 0.05),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 34.0,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5KVsWtDwcdLRc9q1P9N8leBy_zz9gfKZK1Q&usqp=CAU'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.03),
                            child: Text("Dr.Parth Patel",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.03),
                            child: Text("Heart Surgeon-Flower Hospitel's",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.call),
                                onPressed: null,
                                color: Colors.blue[800],
                                disabledColor: Colors.blue[800],
                              ),
                              IconButton(
                                icon: Icon(Icons.message),
                                onPressed: null,
                                color: Colors.orange[400],
                                disabledColor: Colors.orange[400],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05, bottom: screenHeight * 0.02),
                  child: Text(
                    "About Doctor",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      bottom: screenHeight * 0.02 - 4),
                  child: Text(
                    "Doctors That Work Within a Community They are the frontline and first point of contact in a patient's health care. They diagnose and treat their patients for all sorts of ailments, and also refer their patients to the appropriate specialist doctor when needed for specific medical opinions and advice.",
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        height: 1.4),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05, bottom: screenHeight * 0.01),
                  child: Text(
                    "Upcoming Schedules",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: screenHeight * 0.2,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(11)),
                          height: screenHeight * 0.09 + 14,
                          margin: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              right: screenWidth * 0.05,
                              bottom: screenHeight * 0.01),
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.03),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green[200],
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                    alignment: Alignment.center,
                                    height: screenHeight * 0.07,
                                    width: screenWidth * 0.1 + 8,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.green[700]),
                                        ),
                                        Text(
                                          "Jan",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,
                                              color: Colors.green[700]),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.04),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Consultation",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800)),
                                      Text("Sunday .  9am-11am",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
