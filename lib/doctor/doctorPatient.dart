import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/common/chatscreen/ChatPage.dart';
import 'package:hospital_management/doctor/doctorPatientDetail.dart';
import 'package:hospital_management/utils/size.dart';
import 'package:shimmer/shimmer.dart';

class DoctorPatient extends StatefulWidget {
  @override
  _DoctorPatientState createState() => _DoctorPatientState();
}

class _DoctorPatientState extends State<DoctorPatient> {
  var _onlinePatient = FirebaseDatabase.instance
      .reference()
      .child('registration')
      .orderByChild('type')
      .equalTo("patient");

  bool _all = true;
  bool _men = false;
  bool _women = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Patients List",
              style: TextStyle(fontSize: 22.9, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: screenHeight * 0.03 - 6,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02 - 6,
                    ),
                    //Filter Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.3,
                          decoration: BoxDecoration(
                              color: _all == true
                                  ? Colors.white
                                  : Color.fromARGB(20, 150, 120, 120),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: _all == true ? 2 : 0,
                                    color: _all == true
                                        ? Colors.black12
                                        : Colors.white,
                                    offset: Offset(0, 0),
                                    spreadRadius: _all == true ? 1 : 0)
                              ]),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _all = true;
                                _men = false;
                                _women = false;
                              });
                            },
                            child: Text(
                              "All",
                              style: TextStyle(color: Colors.blue[900]),
                            ),
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.3,
                          decoration: BoxDecoration(
                              color: _men == true
                                  ? Colors.white
                                  : Color.fromARGB(20, 150, 120, 120),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: _men == true ? 2 : 0,
                                    color: _men == true
                                        ? Colors.black12
                                        : Colors.white,
                                    offset: Offset(0, 0),
                                    spreadRadius: _men == true ? 1 : 0)
                              ]),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _all = false;
                                _men = true;
                                _women = false;
                              });
                            },
                            child: Text("Men",
                                style: TextStyle(color: Colors.blue[900])),
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.3,
                          decoration: BoxDecoration(
                              color: _women == true
                                  ? Colors.white
                                  : Color.fromARGB(20, 150, 120, 120),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: _women == true ? 2 : 0,
                                    color: _women == true
                                        ? Colors.black12
                                        : Colors.white,
                                    offset: Offset(0, 0),
                                    spreadRadius: _women == true ? 1 : 0)
                              ]),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _all = false;
                                _men = false;
                                _women = true;
                              });
                            },
                            child: Text("Women",
                                style: TextStyle(color: Colors.blue[900])),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.02 - 6,
                    ),
                    Expanded(
                      child: Container(
                        child: StreamBuilder(
                          stream: _onlinePatient.onValue,
                          builder: (context, snapshot) {
                            if (snapshot.data == null)
                              return Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.teal,
                                  child: ListView.builder(
                                    itemCount: 9,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: Icon(
                                          Icons.image,
                                          size: 39,
                                        ),
                                        title: SizedBox(
                                          height: screenHeight * 0.03,
                                          child: Container(
                                            color: Colors.green,
                                          ),
                                        ),
                                      );
                                    },
                                  ));
                            var _key = snapshot.data.snapshot.value.keys;
                            var _data = snapshot.data.snapshot.value;
                            List<Map<String, dynamic>> _datalist = [];
                            for (var item in _key) {
                              if (_data[item]['sex'] == "Mr" && _men == true) {
                                _datalist.add({
                                  'first_name': _data[item]['first_name'],
                                  'last_name': _data[item]['last_name'],
                                  'number': _data[item]['number'],
                                  'date': _data[item]['date'],
                                  'user_id': _data[item]['user_id'],
                                  'user_name': _data[item]['user_name'],
                                  'gender': _data[item]['sex'],
                                  'email_id': _data[item]['email_id'],
                                });
                              }
                              if (_data[item]['sex'] == "Mis" &&
                                  _women == true) {
                                _datalist.add({
                                  'first_name': _data[item]['first_name'],
                                  'last_name': _data[item]['last_name'],
                                  'number': _data[item]['number'],
                                  'date': _data[item]['date'],
                                  'user_id': _data[item]['user_id'],
                                  'user_name': _data[item]['user_name'],
                                  'gender': _data[item]['sex'],
                                  'email_id': _data[item]['email_id'],
                                });
                              }
                              if (_all == true) {
                                _datalist.add({
                                  'first_name': _data[item]['first_name'],
                                  'last_name': _data[item]['last_name'],
                                  'number': _data[item]['number'],
                                  'date': _data[item]['date'],
                                  'user_id': _data[item]['user_id'],
                                  'user_name': _data[item]['user_name'],
                                  'gender': _data[item]['sex'],
                                  'email_id': _data[item]['email_id'],
                                });
                              }
                            }

                            return ListView.builder(
                              itemCount: _datalist.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DoctorPatientDetail(
                                              _datalist[index],
                                              NetworkImage(
                                                  'https://i.pinimg.com/236x/ed/6c/38/ed6c382b3bf83cba46adb1efec0e49b6.jpg')),
                                        ));
                                  },
                                  child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 29,
                                        child: Icon(
                                            Icons.supervised_user_circle_sharp),
                                      ),
                                      title: Text(_datalist[index]
                                              ['first_name'] +
                                          " " +
                                          _datalist[index]['last_name']),
                                      subtitle:
                                          Text(_datalist[index]['number']),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.message,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ChatPage(
                                                      _datalist[index]
                                                          ['user_name'],
                                                      _datalist[index]
                                                          ['user_id'],
                                                      NetworkImage(
                                                          "https://i.pinimg.com/236x/ed/6c/38/ed6c382b3bf83cba46adb1efec0e49b6.jpg"))));
                                        },
                                      )),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
