import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/appointment/appoinmentData.dart';
import 'package:hospital_management/utils/size.dart';

class Online extends StatefulWidget {
  @override
  _OnlineState createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
  //firebase
  DatabaseReference waitingAppoinment =
      FirebaseDatabase.instance.reference().child("appointment");

  DatabaseReference _registration =
      FirebaseDatabase.instance.reference().child("registration");

  @override
  void initState() {
    super.initState();

    getAppoinmentList();
  }

  getAppoinmentList() {
    _appoinmentList.clear();
    _appoinmentUserDatail.clear();
    waitingAppoinment
        .orderByChild("status")
        .equalTo("waiting")
        .once()
        .then((DataSnapshot snap) {
      var _key = snap.value.keys;
      var data = snap.value;
      for (var item in _key) {
        AppoinmentData appoinmentData = new AppoinmentData(
            data[item]['user_id'],
            data[item]['date'],
            data[item]['time'],
            data[item]['token_no']);
        _appoinmentList.add(appoinmentData);
      }

      _registration.once().then((DataSnapshot snap) {
        var _key = snap.value.keys;
        var _data = snap.value;
        for (var i = 0; i < _appoinmentList.length; i++) {
          for (var item in _key) {
            if (_appoinmentList[i].userId == item) {
              AppoinmentUserDatail appoinmentUserDatail =
                  new AppoinmentUserDatail(_data[item]['first_name'],
                      _data[item]['last_name'], _data[item]['number']);
              _appoinmentUserDatail.add(appoinmentUserDatail);
            }
          }
        }
        setState(() {});
      });

      setState(() {});
    });
  }

  List<AppoinmentData> _appoinmentList = [];
  List<AppoinmentUserDatail> _appoinmentUserDatail = [];

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    String data = "4";
    return data == ""
        ? Center(
            child: Image.asset("images/nodatafound.png"),
          )
        : Container(
            child: ListView.builder(
                itemCount: _appoinmentList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black26,
                              offset: Offset(0, 0))
                        ],
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(20.0)),
                    margin: EdgeInsets.only(
                        top: screenHeight * 0.02,
                        left: screenWidth * 0.06,
                        right: screenWidth * 0.06),
                    height: screenHeight * 0.2 - 40,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.02, left: screenWidth * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.supervised_user_circle,
                                    size: screenHeight * 0.05,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: screenWidth * 0.03),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _appoinmentUserDatail[index]
                                                  .firstName +
                                              " " +
                                              _appoinmentUserDatail[index]
                                                  .lastName,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                            height: screenHeight * 0.01 - 5),
                                        Text(
                                          _appoinmentUserDatail[index].number,
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text("Token Number:-" +
                                  _appoinmentList[index].tokeNumber.toString()),
                              Text("Time:-" + _appoinmentList[index].time)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(right: screenWidth * 0.03),
                                width: screenWidth * 0.2 + 19,
                                height: screenHeight * 0.04 + 7,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.blue[800]),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: TextButton(
                                  onPressed: () {
                                    waitingAppoinment
                                        .child(_appoinmentList[index]
                                            .tokeNumber
                                            .toString())
                                        .update({'status': "book"}).then(
                                            (value) => getAppoinmentList());
                                  },
                                  child: Text("Accept"),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(right: screenWidth * 0.03),
                                width: screenWidth * 0.2 + 19,
                                height: screenHeight * 0.04 + 7,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(color: Colors.red[800]),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: TextButton(
                                  onPressed: () {
                                    waitingAppoinment
                                        .child(_appoinmentList[index]
                                            .tokeNumber
                                            .toString())
                                        .remove()
                                        .then((value) => getAppoinmentList());
                                  },
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
  }
}
