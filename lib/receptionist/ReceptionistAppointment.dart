import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/DashBord.dart';
import 'package:hospital_management/utils/size.dart';

import 'appointment/complite.dart';
import 'appointment/offline.dart';
import 'appointment/online.dart';

class ReceptionistAppointment extends StatefulWidget {
  @override
  _ReceptionistAppointmentState createState() =>
      _ReceptionistAppointmentState();
}

class _ReceptionistAppointmentState extends State<ReceptionistAppointment>
    with TickerProviderStateMixin {
  TabController controller;

  DatabaseReference waitingAppoinment =
      FirebaseDatabase.instance.reference().child('appointment');
  var onlinePatient =
      FirebaseDatabase.instance.reference().child('registration');
  var offlinePatient =
      FirebaseDatabase.instance.reference().child('offlinePatient');

  List<AssetImage> imageList = [
    AssetImage('images/ra1.png'),
    AssetImage('images/ra2.png'),
    AssetImage('images/ra3.png'),
    AssetImage('images/ra4.png')
  ];
  List<String> nameOfList = [
    'Pending Appointment',
    'Offline Patient',
    'Totel Patient',
    'Chat'
  ];

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashBord(),
                  ),
                  (route) => false)),
          bottom: PreferredSize(
              preferredSize: Size(0, screenHeight * 0.2),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          bottom: screenHeight * 0.01,
                          left: screenWidth * 0.03,
                          right: screenWidth * 0.03),
                      height: screenHeight * 0.1 + 40,
                      child: StreamBuilder(
                        stream: waitingAppoinment.onValue,
                        builder: (context, snapshot) {
                          if (snapshot.data == null)
                            return Container(
                                child: Container(
                              padding: EdgeInsets.only(
                                  top: screenHeight * 0.3 - 20,
                                  bottom: screenHeight * 0.3 - 20,
                                  left: screenWidth * 0.4 + 8,
                                  right: screenWidth * 0.4 + 8),
                              child: CircularProgressIndicator(),
                            ));

                          return StreamBuilder(
                            stream: onlinePatient.onValue,
                            builder: (context, snapshot1) {
                              if (snapshot1.data == null)
                                return Container(
                                    child: Container(
                                  padding: EdgeInsets.only(
                                      top: screenHeight * 0.3 - 20,
                                      bottom: screenHeight * 0.3 - 20,
                                      left: screenWidth * 0.4 + 8,
                                      right: screenWidth * 0.4 + 8),
                                  child: CircularProgressIndicator(),
                                ));
                              return StreamBuilder(
                                stream: offlinePatient.onValue,
                                builder: (context, snapshot2) {
                                  if (snapshot2.data == null)
                                    return Container(
                                        child: Container(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.3 - 20,
                                          bottom: screenHeight * 0.3 - 20,
                                          left: screenWidth * 0.4 + 8,
                                          right: screenWidth * 0.4 + 8),
                                      child: CircularProgressIndicator(),
                                    ));
                                  var _key = snapshot.data.snapshot.value.keys;
                                  var _data = snapshot.data.snapshot.value;
                                  int _waiting = 0;
                                  for (var item in _key) {
                                    if (_data[item]['status'] == "waiting") {
                                      _waiting = _waiting + 1;
                                    }
                                  }
                                  var _online = snapshot1
                                          .data.snapshot.value.keys.length -
                                      2;
                                  var _offline =
                                      snapshot2.data.snapshot.value.keys.length;
                                  List _count = [];
                                  List _name = [
                                    "Padding Appointment",
                                    "Online Patient",
                                    "Offline Patient"
                                  ];
                                  _count.add(_waiting);
                                  _count.add(_online);
                                  _count.add(_offline);
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _count.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageList[0],
                                                  fit: BoxFit.fill),
                                              color: Colors.blue[200],
                                              borderRadius:
                                                  BorderRadius.circular(14)),
                                          margin: EdgeInsets.only(
                                              left: screenWidth * 0.02,
                                              right: screenWidth * 0.02),
                                          width: screenWidth * 0.3 + 16,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight * 0.02,
                                                left: screenWidth * 0.03),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _count[index].toString(),
                                                      style: TextStyle(
                                                          fontSize: 28,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      _name[index],
                                                      style: TextStyle(
                                                          fontSize: 17.8,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ));
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                      )),
                  Container(
                    color: Colors.white,
                    child: TabBar(
                        labelPadding: EdgeInsets.only(
                            top: screenHeight * 0.02,
                            bottom: screenHeight * 0.02),
                        controller: controller,
                        labelColor: Colors.black,
                        indicatorColor: Colors.black,
                        indicatorPadding: EdgeInsets.only(
                            left: screenWidth * 0.1, right: screenWidth * 0.1),
                        tabs: [
                          Text("online"),
                          Text("Offline"),
                          Text("waiting"),
                        ]),
                  ),
                ],
              )),
        ),
        body: TabBarView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [Online(), Offline(), Complite()],
        ));
  }
}
