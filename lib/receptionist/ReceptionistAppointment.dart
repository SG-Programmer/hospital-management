import 'package:flutter/material.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    controller = TabController(length: 4, vsync: this);
    List<AssetImage> imageList = [
      AssetImage('images/ra1.png'),
      AssetImage('images/ra2.png'),
      AssetImage('images/ra3.png'),
      AssetImage('images/ra4.png')
    ];
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: Size(0, height * 0.2),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: height * 0.03,
                        left: width * 0.03,
                        right: width * 0.03),
                    height: height * 0.1 + 40,
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
                                  left: width * 0.02, right: width * 0.02),
                              width: width * 0.3 + 16,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.02, left: width * 0.03),
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
                            top: height * 0.02, bottom: height * 0.02),
                        controller: controller,
                        labelColor: Colors.black,
                        indicatorColor: Colors.black,
                        indicatorPadding: EdgeInsets.only(
                            left: width * 0.1, right: width * 0.1),
                        tabs: [
                          Text("online"),
                          Text("Offline"),
                          Text("Upcoming"),
                          Text("Complited")
                        ]),
                  ),
                ],
              )),
        ),
        body: TabBarView(
          controller: controller,
          children: [Online(), Offline(), Upcomming(), Complite()],
        ));
  }
}
