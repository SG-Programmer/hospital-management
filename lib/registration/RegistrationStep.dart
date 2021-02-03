import 'package:flutter/material.dart';
import 'package:hospital_management/Registration/FinalRegistrationPage.dart';
import 'package:hospital_management/registration/LoginPage.dart';

import 'package:hospital_management/registration/RegistrationPage.dart';
import 'package:hospital_management/utils/size.dart';

class RegistrationStep extends StatefulWidget {
  @override
  _RegistrationStepState createState() => _RegistrationStepState();
}

class _RegistrationStepState extends State<RegistrationStep>
    with TickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);

    Color on = Colors.deepOrange[600];
    Color off = Colors.deepOrange[300];
    /* Color colornames; */

    stepbar(String name, String data, Color colorname) {
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: screenHeight * 0.05,
            width: screenHeight * 0.05,
            decoration: BoxDecoration(
                color: colorname, borderRadius: BorderRadius.circular(8.0)),
            child: Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Text(data),
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Create Account"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                    height: screenHeight / 7,
                    child: Padding(
                      padding: EdgeInsets.only(top: 34.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              stepbar("1", "Basic info",
                                  controller.index == 0 ? on : off),
                              stepbar("2", "Registration",
                                  controller.index == 1 ? on : off),
                              stepbar("3", "Complite",
                                  controller.index == 2 ? on : off),
                            ],
                          ),
                        ],
                      ),
                    )),
                Container(
                  height: screenHeight / 1.2,
                  padding: EdgeInsets.only(top: screenHeight * 0.02),
                  width: double.infinity,
                  child: TabBarView(
                    controller: controller,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      RegistrationPage(
                        controller: controller,
                      ),
                      FinalRegistrationPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
