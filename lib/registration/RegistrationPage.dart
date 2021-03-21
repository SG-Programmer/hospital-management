import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hospital_management/registration/FinalRegistrationPage.dart';
import 'package:hospital_management/utils/size.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //TextField Controller
  TextEditingController sexController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  //variable
  String sex = "Mr";
  DateTime date = DateTime.now();
  String imageURL;
  var imageName;
  //Image
  File image;
  //List And Map
  List<String> sexList = ["Mr", "Mis", "Other"];

  selectDate(BuildContext context) async {
    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2022));
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

/*     TextEditingController name = TextEditingController(); */

    textfield(String hintName, String labeltext,
        TextEditingController fieldController, String Function(String) v,
        [Icon iconname]) {
      return Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.01),
        child: Container(
          child: TextFormField(
            controller: fieldController,
            validator: v,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintName,
              labelText: labeltext,
              prefixIcon: iconname,
            ),
          ),
        ),
      );
    }

    final picker = ImagePicker();
    Future imagePicker() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
          imageName = image.path.split("/").last;
        } else {
          print("Image not select");
        }
      });
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 58,
                      backgroundImage: image == null
                          ? AssetImage('images/user.png')
                          : AssetImage(image.path)),
                  TextButton(
                    onPressed: () {
                      imagePicker();
                    },
                    child: Text(
                      "Chose Profile",
                      style: TextStyle(fontSize: 15.6, color: Colors.blue),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: screenWidth / 6,
                          height: screenHeight * 0.09,
                          alignment: Alignment.center,
                          child: DropdownButton(
                              isExpanded: true,
                              value: sex,
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  sex = value;
                                });
                              },
                              items: sexList.map((e) {
                                return DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                );
                              }).toList())),
                      Container(
                        width: screenWidth / 2.6,
                        child: textfield(
                            "Last Name",
                            "First Name",
                            firstNameController,
                            ValidationBuilder().minLength(1).build()),
                      ),
                      Container(
                        width: screenWidth / 2.6,
                        child: textfield(
                            "Last Name",
                            "Last Name",
                            lastNameController,
                            ValidationBuilder().minLength(1).build()),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Container(
                    height: screenHeight * 0.09,
                    padding: EdgeInsets.only(left: screenWidth * 0.03),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Text(date.day.toString() +
                                "/" +
                                date.month.toString() +
                                "/" +
                                date.year.toString())
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              selectDate(context);
                            },
                            child: Text("Select Date"))
                      ],
                    ),
                  ),
                  textfield(
                    "Mobile no",
                    "Number",
                    numberController,
                    ValidationBuilder().phone().build(),
                    Icon(Icons.confirmation_number),
                  ),
                  textfield(
                      "City",
                      "City",
                      cityController,
                      ValidationBuilder().minLength(1).build(),
                      Icon(Icons.location_city)),
                  textfield(
                    "PinCode",
                    "PinCode",
                    pinCodeController,
                    ValidationBuilder().minLength(6).maxLength(6).build(),
                    Icon(Icons.code),
                  ),
                  textfield(
                    "Address",
                    "Address",
                    addressController,
                    ValidationBuilder().minLength(10).build(),
                    Icon(Icons.location_city),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.yellow,
                        ),
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.4,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          onPressed: () {
                            if (_formKey.currentState.validate() &&
                                image != null) {
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
                              FirebaseStorage.instance
                                  .ref()
                                  .child("registration/$imageName")
                                  .putFile(image)
                                  .then((val) => print(val.ref
                                          .getDownloadURL()
                                          .then((value) => imageURL = value)
                                          .then((value) {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FinalRegistrationPage(
                                                      sexController:
                                                          sexController,
                                                      firstNameController:
                                                          firstNameController,
                                                      lastNameController:
                                                          lastNameController,
                                                      date: date,
                                                      numberController:
                                                          numberController,
                                                      cityController:
                                                          cityController,
                                                      pinCodeController:
                                                          pinCodeController,
                                                      addressController:
                                                          addressController,
                                                      sex: sex,
                                                      imageURL: imageURL),
                                            ));
                                      })));
                            }
                          },
                          child: Text("Continue"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
