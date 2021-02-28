import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

import 'appointment/complite.dart';
import 'appointment/offline.dart';
import 'appointment/online.dart';
import 'appointment/upcomming.dart';

class ReceptionistAppointment extends StatefulWidget {
  @override
  _ReceptionistAppointmentState createState() =>
      _ReceptionistAppointmentState();
}

class _ReceptionistAppointmentState extends State<ReceptionistAppointment>
    with TickerProviderStateMixin {
  TabController controller;

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    controller = TabController(length: 3, vsync: this);
    List<AssetImage> imageList = [
      AssetImage('images/ra1.png'),
      AssetImage('images/ra2.png'),
      AssetImage('images/ra3.png'),
      AssetImage('images/ra4.png')
    ];
    return Scaffold(
        appBar: AppBar(
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
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageList[index],
                                      fit: BoxFit.fill),
                                  color: Colors.blue[200],
                                  borderRadius: BorderRadius.circular(14)),
                              margin: EdgeInsets.only(
                                  left: screenWidth * 0.02,
                                  right: screenWidth * 0.02),
                              width: screenWidth * 0.3 + 16,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.02,
                                    left: screenWidth * 0.03),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "12",
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text("Appointment Pending.")
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        }),
                  ),
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
