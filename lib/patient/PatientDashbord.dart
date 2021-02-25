import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/patient/NotificationPage.dart';
import 'package:hospital_management/patient/PatientHomePage.dart';
import 'package:hospital_management/registration/LoginPage.dart';
import 'package:hospital_management/utils/size.dart';

import 'SearchPage.dart';

class PatientDashbord extends StatefulWidget {
  @override
  _PatientDashbordState createState() => _PatientDashbordState();
}

class _PatientDashbordState extends State<PatientDashbord> {
  double screenPaddingSide = screenWidth * 0.04;
  double pageInd = 0;
  bool seeAds = true;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.04,
                left: screenPaddingSide,
                right: screenPaddingSide),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FirebaseAuth.instance.currentUser.email == null
                    ? "dd"
                    : Row(
                        children: [
                          IconButton(
                              color: Colors.red,
                              icon: Icon(Icons.logout),
                              onPressed: () {
                                FirebaseAuth.instance.signOut().then((value) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                      (route) => false);
                                });
                              }),
                          Text(FirebaseAuth.instance.currentUser.email),
                        ],
                      ),
                IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationPage(),
                          ));
                    })
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenPaddingSide, top: screenHeight * 0.05),
            child: Text(
              "Appoitment With\na doctor",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                  fontSize: 27),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenPaddingSide,
                top: screenHeight * 0.06,
                right: screenPaddingSide),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                color: Colors.black12,
              ),
              height: screenHeight * 0.06,
              width: screenWidth * 0.9,
              child: TextField(
                controller: searchController,
                onSubmitted: (val) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(val),
                      ));
                },
                onChanged: (val) {},
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: "Search your symptoms..",
                    prefixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: null),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SearchPage(searchController.text),
                            ));
                      },
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenPaddingSide, top: screenHeight * 0.05),
            child: Text("How can we help you ?",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 20)),
          ),
          Container(
            height: screenHeight * 0.1 + 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.only(
                        left: screenPaddingSide,
                        top: screenHeight * 0.02,
                        bottom: screenHeight * 0.02),
                    width: screenWidth * 0.2 + 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 0),
                              blurRadius: 5,
                              spreadRadius: 0)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.supervised_user_circle_outlined,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PatientHomePage()));
                            }),
                        Text(
                          "Home visit",
                        )
                      ],
                    ));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenPaddingSide, top: screenHeight * 0.02),
            child: Text("Popular categories",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 20)),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: screenPaddingSide, top: screenHeight * 0.09),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: pageInd,
                    axis: Axis.vertical,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(9.0, 19.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
              ),
              Container(
                  height: screenHeight * 0.3 - 10,
                  width: screenWidth * 0.9,
                  child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      onPageChanged: (index) {
                        setState(() {
                          pageInd = index.toDouble();
                        });
                      },
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          height: screenHeight * 0.2,
                          width: screenWidth * 0.9,
                          margin: EdgeInsets.only(
                              left: screenPaddingSide,
                              top: screenHeight * 0.01,
                              bottom: screenHeight * 0.01),
                          decoration: BoxDecoration(
                              color: Colors.red[500],
                              borderRadius: BorderRadius.circular(13)),
                          child: Text("fsdff"),
                        );
                      })),
            ],
          ),
        ],
      ),
    );
  }
}
