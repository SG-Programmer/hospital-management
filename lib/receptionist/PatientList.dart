import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/common/chatscreen/ChatPage.dart';
import 'package:hospital_management/receptionist/PatientDatails.dart';
import 'package:hospital_management/receptionist/PatientListData.dart';
import 'package:hospital_management/utils/size.dart';

class PatientList extends StatefulWidget {
  TabController controller;
  PatientList({this.controller});
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  List<NetworkImage> profilePhoto = [
    NetworkImage(
        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
    NetworkImage(
        'https://sm.askmen.com/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_gstt.jpg'),
    NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU53EcOIyxE7pOZJBvGHJGbDk39EYxvOhbdw&usqp=CAU'),
    NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5KVsWtDwcdLRc9q1P9N8leBy_zz9gfKZK1Q&usqp=CAU'),
    NetworkImage(
        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
    NetworkImage(
        'https://sm.askmen.com/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_gstt.jpg'),
    NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU53EcOIyxE7pOZJBvGHJGbDk39EYxvOhbdw&usqp=CAU'),
    NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5KVsWtDwcdLRc9q1P9N8leBy_zz9gfKZK1Q&usqp=CAU'),
    NetworkImage(
        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
    NetworkImage(
        'https://sm.askmen.com/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_gstt.jpg'),
    NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU53EcOIyxE7pOZJBvGHJGbDk39EYxvOhbdw&usqp=CAU'),
    NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5KVsWtDwcdLRc9q1P9N8leBy_zz9gfKZK1Q&usqp=CAU'),
    NetworkImage(
        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
    NetworkImage(
        'https://sm.askmen.com/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_gstt.jpg'),
    NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU53EcOIyxE7pOZJBvGHJGbDk39EYxvOhbdw&usqp=CAU'),
    NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5KVsWtDwcdLRc9q1P9N8leBy_zz9gfKZK1Q&usqp=CAU')
  ];

  List<String> name = [
    "parth",
    "smit",
    "harsh",
    "purv",
    "darshan",
    "ravi",
    "parth",
    "smit",
    "harsh",
    "purv",
    "darshan",
    "ravi",
    "parth",
    "smit",
    "harsh",
    "purv",
    "darshan",
    "ravi"
  ];

  List<PatientListData> patientData = [];

  DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('registration');

  @override
  void initState() {
    super.initState();
    _databaseReference.once().then((DataSnapshot snapshot) {
      var _key = snapshot.value.keys;
      var _data = snapshot.value;
      patientData.clear();
      for (var _getOneKey in _key) {
        PatientListData patientListData = new PatientListData(
            _data[_getOneKey]['first_name'],
            _data[_getOneKey]['last_name'],
            _data[_getOneKey]['user_name'],
            _data[_getOneKey]['email_id'],
            _data[_getOneKey]['number'],
            _data[_getOneKey]['address'],
            _data[_getOneKey]['date']);
        patientData.add(patientListData);
      }
      setState(() {
        print(patientData.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text("Patient List"),
      ),
      body: Container(
        width: double.infinity,
        child: ListView.builder(
          itemCount: patientData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(
                  top: index == 0 ? screenHeight * 0.0 : screenHeight * 0.01,
                  left: screenWidth * 0.07),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: profilePhoto[index],
                  ),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientDatails(
                              userName: patientData[index].userNameP,
                              firstName: patientData[index].firstNameP,
                              lastName: patientData[index].lastNameP,
                              email: patientData[index].emailP,
                              number: patientData[index].numberP,
                              date: patientData[index].brithDateP,
                              address: patientData[index].addressP,
                            ),
                          ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patientData[index].firstNameP +
                              " " +
                              patientData[index].lastNameP,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(patientData[index].userNameP,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black38))
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.2 + 14),
                  IconButton(
                      icon: Icon(
                        Icons.call,
                        color: Colors.blue[900],
                      ),
                      onPressed: null),
                  IconButton(
                      icon: Icon(
                        Icons.message,
                        color: Colors.blue[900],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                patientData[index].userNameP,
                                FirebaseAuth.instance.currentUser.uid,
                                profilePhoto[index],
                              ),
                            ));
                      })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
