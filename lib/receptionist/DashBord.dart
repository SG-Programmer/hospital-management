import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:hospital_management/receptionist/HomPage.dart';
import 'package:hospital_management/registration/LoginPage.dart';
import 'package:hospital_management/utils/size.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBord extends StatefulWidget {
  @override
  _DashBordState createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  List<String> menulist = ["Appoitment", "Chat", "Doctro", "User", "Five"];
  List<IconData> iconlist = [
    Icons.calendar_today,
    Icons.message,
    Icons.local_hospital,
    Icons.supervised_user_circle,
    Icons.star
  ];

  List<Map<String, dynamic>> _list = [{}];

  DatabaseReference _appointment =
      FirebaseDatabase.instance.reference().child('appointment');
  DatabaseReference _registration =
      FirebaseDatabase.instance.reference().child('registration');
  DatabaseReference _offlinePatient =
      FirebaseDatabase.instance.reference().child('offlinePatient');
  DatabaseReference _dailyavg =
      FirebaseDatabase.instance.reference().child('dailyavg');

  _sharedPreferences() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("auth");
  }

  dynamic _getpatientDatails(var data) {
    _registration.child(data['user_id']).once().then((DataSnapshot snap) {
      if (snap.value != null) {
        setState(() {
          _list.add({
            'token_no': data['token_no'],
            'first_name': snap.value['first_name'],
            'last_name': snap.value['last_name'],
          });
        });
      }
    });
    _offlinePatient.child(data['user_id']).once().then((DataSnapshot snap) {
      if (snap.value != null) {
        setState(() {
          _list.add({
            'token_no': data['token_no'],
            'first_name': snap.value['first_name'],
            'last_name': snap.value['last_name'],
          });
        });
      }
    });
  }

  List<double> _monthList = [0.0, 0.0, 0.0, 0.0, 0.0];

  @override
  void initState() {
    _list.clear();

    _dailyavg.orderByChild('avg').once().then((DataSnapshot snap) {
      var _keys = snap.value.keys;
      var _data = snap.value;
      _monthList.clear();

      List<double> _list = [];
      _list.add(0.0);
      for (var item in _keys) {
        _list.add(double.parse(_data[item]['avg'].toString() + ".0"));
      }
      setState(() {
        _monthList = _list;
      });
    });
    _appointment
        .orderByChild('status')
        .equalTo('book')
        .once()
        .then((DataSnapshot snap) {
      var _key = snap.value.keys;
      var _data = snap.value;
      for (var item in _key) {
        _getpatientDatails(_data[item]);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.06,
                    right: screenWidth * 0.06,
                    top: screenHeight * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: Image.network(
                          "https://www.shareicon.net/data/2016/09/15/829473_man_512x512.png"),
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            icon: Icon(Icons.logout),
                            onPressed: () {
                              _sharedPreferences();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                  (route) => false);
                            })),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.05, left: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(fontSize: 24.0),
                    ),
                    Row(
                      children: [
                        Text(
                          "MeCare! ",
                          style: TextStyle(
                              fontSize: 29.0, fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.network(
                              "https://firebasestorage.googleapis.com/v0/b/hospital-management-108.appspot.com/o/medicens.png?alt=media&token=b5237c61-9591-4de1-a5ee-9ffdfe1cd4a4"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.03,
                    right: screenWidth * 0.03,
                    top: screenHeight * 0.03),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360.0)),
                    height: screenHeight * 0.2,
                    child: PageView(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.01,
                                left: screenWidth * 0.05,
                                right: screenWidth * 0.05),
                            margin: EdgeInsets.only(
                                left: screenWidth * 0.04,
                                right: screenWidth * 0.04),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(30.0)),
                            height: screenHeight * 0.2,
                            child: Stack(
                              children: [
                                Sparkline(
                                  data: _monthList,
                                  pointSize: 7.0,
                                  pointsMode: PointsMode.all,
                                  pointColor: Colors.yellow,
                                  fillMode: FillMode.below,
                                  lineColor: Colors.blue[600],
                                  lineWidth: screenHeight * 0.01 + 2,
                                  fillGradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.green[900],
                                        Colors.green[400]
                                      ]),
                                ),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: screenHeight * 0.01),
                                      child: Text(
                                        "Mecare daily patient visits",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 17.2,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ))
                              ],
                            )),
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.03, bottom: screenHeight * 0.01),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(31.0)),
                  height: screenHeight * 0.1 + 12,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                          alignment: Alignment.center,
                          padding: index == 4
                              ? EdgeInsets.only(right: screenWidth * 0.06)
                              : EdgeInsets.only(right: 0),
                          margin: index == 0
                              ? EdgeInsets.only(
                                  left: screenWidth * 0.06,
                                  top: screenHeight * 0.01,
                                  bottom: screenHeight * 0.01)
                              : EdgeInsets.only(
                                  left: screenWidth * 0.05,
                                  top: screenHeight * 0.01,
                                  bottom: screenHeight * 0.01),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0)),
                          width: screenWidth * 0.6,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 7.0,
                                    color: Colors.black12,
                                    offset: Offset(0, 0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _list[index]['token_no'].toString(),
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(_list[index]['first_name'] +
                                        " " +
                                        _list[index]['last_name'])
                                  ],
                                ),
                                Icon(
                                  Icons.supervised_user_circle,
                                  color: Colors.blue[900],
                                  size: 32.0,
                                ),
                              ],
                            ),
                          ));
                    },
                    itemCount: _list.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.06,
                      top: screenWidth * 0.02,
                      bottom: screenWidth * 0.03),
                  child: Text(
                    "Somethig  New Text..!",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: GridView.builder(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.01,
                          left: screenWidth * 0.06,
                          right: screenWidth * 0.06),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.1,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(index),
                                ));
                          },
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6.0,
                                      color: Colors.black12,
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(31.0),
                                  color: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    iconlist[index],
                                    color: Colors.blue,
                                    size: 35.0,
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Text(menulist[index])
                                ],
                              )),
                        );
                      },
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics()),
                ),
              )
            ],
          ),
        )));
  }
}
