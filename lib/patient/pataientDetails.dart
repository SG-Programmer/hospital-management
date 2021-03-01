import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';

String pFirstName;
String pLastName;
String pUserName;
String pDate;
String pNumber;
String pCity;
String pPinCode;
String pAddress;
String pGender;

class PataientDetails {
  setUserDetails(DatabaseReference _databasereference) {
    _databasereference
        .child(FirebaseAuth.instance.currentUser.uid)
        .once()
        .then((value) {
      pFirstName = value.value['first_name'];
      pLastName = value.value['last_name'];
      pUserName = value.value['user_name'];
      pNumber = value.value['number'];
      pDate = value.value['date'];
      pPinCode = value.value['pin_code'];
      pGender = value.value['sex'];
      pAddress = value.value['address'];
      pCity = value.value['city'];
    });
  }
}
