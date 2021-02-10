import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

import 'DoctorDatailPage.dart';

class DoctorList extends StatefulWidget {
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
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
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5KVsWtDwcdLRc9q1P9N8leBy_zz9gfKZK1Q&usqp=CAU')
  ];
  List<String> nameOfDoctor = [
    "parth",
    "smit",
    "darshan",
    "druti",
    "priya",
    "harsh",
    "purv",
    "kenil"
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.3,
          color: Colors.blue[500],
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.02, top: screenHeight * 0.02),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.09, top: screenHeight * 0.1 + 20),
          child: Row(
            children: [
              Text("Top doctors",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600)),
              Icon(
                Icons.star,
                color: Colors.yellow[600],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.2),
          child: Container(
            padding: EdgeInsets.only(top: screenHeight * 0.06),
            height: screenHeight * 0.9,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.09, right: screenWidth * 0.09),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        child: Text("See all"),
                      )
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  height: screenHeight * 0.1 + 25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: profilePhoto.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: profilePhoto[index], fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 7,
                                  color: Colors.black26,
                                  offset: Offset(0, 0))
                            ]),
                        margin: EdgeInsets.only(
                            left: index == 0
                                ? screenWidth * 0.09
                                : screenWidth * 0.04,
                            top: screenHeight * 0.01,
                            bottom: screenHeight * 0.01),
                        height: screenHeight * 0.03,
                        width: screenWidth * 0.2,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Expanded(
                  child: Container(
                    height: screenHeight * 0.5,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorDatailPage(
                                      nameOfDoctor: nameOfDoctor[index],
                                      doctorPhoto: profilePhoto[index]),
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: screenWidth * 0.09,
                                bottom: screenHeight * 0.02,
                                right: screenWidth * 0.07),
                            height: screenHeight * 0.09 + 10,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 7,
                                      color: Colors.black26,
                                      offset: Offset(0, 0))
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14)),
                            child: Row(
                              children: [
                                Container(
                                  height: screenHeight * 0.09,
                                  width: screenWidth * 0.2 - 5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: profilePhoto[index],
                                        fit: BoxFit.fill),
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.02,
                                      top: screenHeight * 0.02 - 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        nameOfDoctor[index],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.01 - 5,
                                      ),
                                      Text(
                                        "Cough & Cold",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Colors.yellow[600],
                                          ),
                                          Text(" 5.0"),
                                          SizedBox(width: screenWidth * 0.01),
                                          Icon(
                                            Icons.circle,
                                            color: Colors.blue[500],
                                            size: 11,
                                          ),
                                          SizedBox(width: screenWidth * 0.01),
                                          Text("10:04 AM - 3:30 PM",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
