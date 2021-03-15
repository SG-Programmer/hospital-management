import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class DoctorMedicine extends StatefulWidget {
  String userId;
  DoctorMedicine(this.userId);
  @override
  _DoctorMedicineState createState() => _DoctorMedicineState();
}

class _DoctorMedicineState extends State<DoctorMedicine> {
  DatabaseReference patientMedicine =
      FirebaseDatabase.instance.reference().child('patientMedicine');
  String medicine = "Penicilhin";
  String one = "0";
  String two = "0";
  String three = "0";
  List<DropdownMenuItem> medicineList = [];
  List<DropdownMenuItem> medicineOne = [
    DropdownMenuItem(
      child: Text("0"),
      value: "0",
    ),
    DropdownMenuItem(
      child: Text("0.5"),
      value: "0.5",
    ),
    DropdownMenuItem(
      child: Text("1"),
      value: "1",
    ),
    DropdownMenuItem(
      child: Text("1.5"),
      value: "1.5",
    ),
    DropdownMenuItem(
      child: Text("2"),
      value: "2",
    ),
  ];
  List<DropdownMenuItem> medicineTwo = [
    DropdownMenuItem(
      child: Text("0"),
      value: "0",
    ),
    DropdownMenuItem(
      child: Text("0.5"),
      value: "0.5",
    ),
    DropdownMenuItem(
      child: Text("1"),
      value: "1",
    ),
    DropdownMenuItem(
      child: Text("1.5"),
      value: "1.5",
    ),
    DropdownMenuItem(
      child: Text("2"),
      value: "2",
    ),
  ];
  _select(List<DropdownMenuItem<dynamic>> list, String name, String index) {
    return DropdownButton(
      items: list,
      onChanged: (val) {
        setState(() {
          name = val;
          if (index == "medicine") {
            medicine = val;
          } else if (index == "one") {
            one = val;
          } else if (index == "two") {
            two = val;
          } else if (index == "three") {
            three = val;
          }
        });
      },
      value: name,
    );
  }

  @override
  void initState() {
    medicineList.clear();
    FirebaseDatabase.instance
        .reference()
        .child('medicine')
        .once()
        .then((DataSnapshot snapshot) {
      for (var key in snapshot.value.keys) {
        medicineList.add(
          DropdownMenuItem(
            child: Text(snapshot.value[key]['name']),
            value: snapshot.value[key]['name'],
          ),
        );
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 238, 241),
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
          child: Column(
        children: [
          Container(
              margin: EdgeInsets.all(11),
              padding: EdgeInsets.all(11),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(11)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Select Medicine:- ",
                          style: TextStyle(fontSize: 16.8)),
                      _select(medicineList, medicine, "medicine")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Morning: ",
                        style: TextStyle(fontSize: 16.8),
                      ),
                      _select(medicineOne, one, "one"),
                      Container(
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.01 - 2,
                        color: Colors.black,
                      ),
                      Text("afternoon: ", style: TextStyle(fontSize: 16.8)),
                      _select(medicineOne, two, "two"),
                      Container(
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.01 - 2,
                        color: Colors.black,
                      ),
                      Text("Night: ", style: TextStyle(fontSize: 16.8)),
                      _select(medicineOne, three, "three"),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {
                      patientMedicine.child(widget.userId).push().set({
                        'name': medicine,
                        'morning': one,
                        'afternoon': two,
                        'night': three,
                        'date': DateTime.now().day.toString() +
                            "-" +
                            DateTime.now().month.toString() +
                            "-" +
                            DateTime.now().year.toString()
                      });
                    },
                    child: Text("Add",
                        style: TextStyle(fontSize: 16.8, color: Colors.blue)),
                  )
                ],
              )),
          Expanded(
            child: Container(
                width: double.infinity,
                child: FirebaseAnimatedList(
                    query: patientMedicine.child(widget.userId),
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return Container(
                          margin: EdgeInsets.all(11),
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Medicine Name:- ${snapshot.value['name']}",
                                      style: TextStyle(fontSize: 16.8)),
                                  Text("${snapshot.value['date']}",
                                      style: TextStyle(fontSize: 14.8)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Morning: ${snapshot.value['morning']}",
                                    style: TextStyle(fontSize: 16.8),
                                  ),
                                  Container(
                                    height: screenHeight * 0.05,
                                    width: screenWidth * 0.01 - 2,
                                    color: Colors.black,
                                  ),
                                  Text(
                                      "Afternoon: ${snapshot.value['afternoon']}",
                                      style: TextStyle(fontSize: 16.8)),
                                  Container(
                                    height: screenHeight * 0.05,
                                    width: screenWidth * 0.01 - 2,
                                    color: Colors.black,
                                  ),
                                  Text("Night: ${snapshot.value['night']}",
                                      style: TextStyle(fontSize: 16.8)),
                                ],
                              ),
                              MaterialButton(
                                onPressed: () {
                                  patientMedicine
                                      .child(widget.userId)
                                      .child(snapshot.key)
                                      .remove();
                                },
                                child: Text("Delete",
                                    style: TextStyle(
                                        fontSize: 16.8, color: Colors.red)),
                              )
                            ],
                          ));
                    })),
          )
        ],
      )),
    );
  }
}
