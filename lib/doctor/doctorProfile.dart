import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hospital_management/doctor/noteDetails.dart';
import '../utils/size.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  //Firebase reference
  DatabaseReference _doctor_datail =
      FirebaseDatabase.instance.reference().child('doctor_detail');

  //Text Controller
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  //Globale Keys
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Variables
  bool submitButtonShow = false;
  bool shoTextField = false;

  _textField(String lableName, TextEditingController _textController,
      String Function(String) _valatidator) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: EdgeInsets.all(5),
        height: screenHeight * 0.09,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  color: Colors.black26,
                  offset: Offset(0, 0),
                  spreadRadius: 0)
            ],
            borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          validator: _valatidator,
          controller: _textController,
          decoration: InputDecoration(
            enabled: shoTextField == true ? true : false,
            labelText: lableName,
            isDense: true,
          ),
        ),
      ),
    );
  }

  _notes() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteDetails(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
            padding: EdgeInsets.all(5),
            height: screenHeight * 0.09,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      color: Colors.black26,
                      offset: Offset(0, 0),
                      spreadRadius: 0)
                ],
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              "Add Your Notes",
              style: TextStyle(color: Colors.blue),
            )),
      ),
    );
  }

  _getData() {
    _doctor_datail.once().then((value) {
      setState(() {
        firstNameController.text = value.value['first_name'];
        lastNameController.text = value.value['last_name'];
        statusController.text = value.value['status'];
        aboutController.text = value.value['about'];
      });
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            top: screenHeight * 0.08),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CircleAvatar(
                radius: screenHeight * 0.05 + 5,
                child: Icon(Icons.supervised_user_circle_outlined),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text("Change Profile"),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: submitButtonShow == true
                      ? TextButton(
                          onPressed: () {
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
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                submitButtonShow = false;
                                shoTextField = false;
                                _doctor_datail.update({
                                  'first_name': firstNameController.text,
                                  'last_name': lastNameController.text,
                                  'status': statusController.text,
                                  'about': aboutController.text
                                }).then((value) {
                                  _getData();
                                  Navigator.pop(context);
                                });
                              }
                            });
                          },
                          child: Text(
                            "Done",
                            style: TextStyle(fontSize: 16),
                          ))
                      : TextButton(
                          onPressed: () {
                            setState(() {
                              submitButtonShow = true;
                              shoTextField = true;
                            });
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(fontSize: 16),
                          ))),
              _textField("First Name", firstNameController,
                  ValidationBuilder().minLength(1).build()),
              _textField("Last Name", lastNameController,
                  ValidationBuilder().minLength(1).build()),
              _textField("Status", statusController,
                  ValidationBuilder().minLength(1).build()),
              _textField("About", aboutController,
                  ValidationBuilder().minLength(1).build()),
              _notes()
            ],
          ),
        ),
      ),
    );
  }
}
