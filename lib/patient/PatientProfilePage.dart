import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hospital_management/patient/pataientDetails.dart';
import 'package:hospital_management/receptionist/PatientDatails.dart';
import 'package:hospital_management/utils/size.dart';

class PatientProfilePage extends StatefulWidget {
  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  //Text Controller
  TextEditingController sexController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  //Firebase
  DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child("registration");

  //Variable
  double setContainerHeight;
  bool edtingMod = false;
  String sex = "Mr";

  //Key
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    sexController.text = pGender;
    firstNameController.text = pFirstName;
    lastNameController.text = pLastName;
    numberController.text = pNumber;
    cityController.text = pCity;
    pinCodeController.text = pPinCode;
    addressController.text = pAddress;
    super.initState();
  }

  containerOfDatails(String labelName, TextEditingController _controller,
      String Function(String) check, Icon iconName) {
    return Container(
      margin: EdgeInsets.only(
          top: screenHeight * 0.01,
          left: screenWidth * 0.02,
          right: screenWidth * 0.02),
      padding: EdgeInsets.only(
          left: screenWidth * 0.02,
          right: screenWidth * 0.02,
          top: screenHeight * 0.02,
          bottom: screenHeight * 0.02),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 2)
      ], color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelName),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.01),
            width: double.infinity,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 0),
                  blurRadius: 15,
                  spreadRadius: 0.1),
            ], color: Colors.white, borderRadius: BorderRadius.circular(7)),
            child: TextFormField(
                textAlign: TextAlign.left,
                validator: check,
                controller: _controller,
                enabled: edtingMod == false ? false : true,
                decoration: InputDecoration(
                  prefixIcon: iconName,
                  border: InputBorder.none,
                )),
          )
        ],
      ),
    );
  }

  userProfile() {
    return Column(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: NetworkImage(
              'https://media.istockphoto.com/photos/portrait-of-a-doctor-picture-id92347287?k=6&m=92347287&s=612x612&w=0&h=URJcB3uKHzlWq42b5UjoA2bd8hPI8B1RLI8ZIpUMsRc='),
        ),
        Divider(
          color: Colors.black26,
          thickness: 2.3,
          height: 29,
          endIndent: 176,
          indent: 176,
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Text(pUserName,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19)),
        Text(pGender + " " + pFirstName + " " + pLastName,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black45)),
      ],
    );
  }

  userProfile2() {
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.1,
        ),
        CircleAvatar(
          radius: 55,
          backgroundImage: NetworkImage(
              'https://media.istockphoto.com/photos/portrait-of-a-doctor-picture-id92347287?k=6&m=92347287&s=612x612&w=0&h=URJcB3uKHzlWq42b5UjoA2bd8hPI8B1RLI8ZIpUMsRc='),
        ),
        SizedBox(
          width: screenWidth * 0.1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pUserName,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19)),
            Text(pGender + " " + pFirstName + " " + pLastName,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black45)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: edtingMod == false
                ? screenHeight * 0.4 - 15
                : screenHeight * 0.3 - 15,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.black26,
                      offset: Offset(0, 0),
                      spreadRadius: 3)
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 26.5,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    edtingMod == false
                        ? IconButton(
                            icon: Icon(
                              Icons.edit_location_outlined,
                              size: 26.5,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                edtingMod == false
                                    ? edtingMod = true
                                    : edtingMod = false;
                              });
                            })
                        : TextButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  edtingMod == false
                                      ? edtingMod = true
                                      : edtingMod = false;
                                });
                                _registration();
                                PataientDetails()
                                    .setUserDetails(_databaseReference);
                              }
                            },
                            child: Text("Done",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 17.5)))
                  ],
                ),
                edtingMod == false ? userProfile() : userProfile2()
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    containerOfDatails(
                        "First Name",
                        firstNameController,
                        ValidationBuilder().minLength(1).build(),
                        Icon(Icons.supervised_user_circle_outlined)),
                    containerOfDatails(
                        "Last Name",
                        lastNameController,
                        ValidationBuilder().minLength(1).build(),
                        Icon(Icons.supervised_user_circle_outlined)),
                    containerOfDatails(
                        "Mobile Number",
                        numberController,
                        ValidationBuilder().minLength(10).maxLength(10).build(),
                        Icon(Icons.phone)),
                    containerOfDatails(
                        "City",
                        cityController,
                        ValidationBuilder().minLength(1).build(),
                        Icon(Icons.location_city)),
                    containerOfDatails(
                        "Address",
                        addressController,
                        ValidationBuilder().minLength(10).build(),
                        Icon(Icons.location_city_rounded)),
                    containerOfDatails(
                        "Pin Code",
                        pinCodeController,
                        ValidationBuilder().minLength(6).maxLength(6).build(),
                        Icon(Icons.confirmation_number)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _registration() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.5,
                  bottom: screenHeight * 0.4,
                  left: screenWidth * 0.4 + 7,
                  right: screenWidth * 0.4 + 7),
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 3.2,
              ));
        });
    _databaseReference.child(FirebaseAuth.instance.currentUser.uid).update({
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "number": numberController.text,
      "city": cityController.text,
      "pin_code": pinCodeController.text,
      "address": addressController.text,
    }).then((value) => Navigator.pop(context));
  }
}
