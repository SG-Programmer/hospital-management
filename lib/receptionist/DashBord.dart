import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/HomPage.dart';

class DashBord extends StatefulWidget {
  @override
  _DashBordState createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<String> menulist = ["Appoitment", "Chat", "Doctro", "User", "Five"];
    List<IconData> iconlist = [
      Icons.calendar_today,
      Icons.message,
      Icons.local_hospital,
      Icons.supervised_user_circle,
      Icons.star
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.06,
                    right: width * 0.06,
                    top: height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: Image.network(
                          "https://www.shareicon.net/data/2016/09/15/829473_man_512x512.png"),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(
                          "https://cdn.onlinewebfonts.com/svg/img_75779.png"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.05, left: width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(fontSize: 24.0),
                    ),
                    Row(
                      children: [
                        Text(
                          "MeCare! ",
                          style: TextStyle(
                              fontSize: 29.0, fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.network(
                              "https://pics.clipartpng.com/Green_and_White_Pills_Capsules_PNG_Clipart-3292.png"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.03,
                    right: width * 0.03,
                    top: height * 0.03),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(360.0)),
                  height: height * 0.2,
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        margin: index == 0
                            ? EdgeInsets.only(
                                left: width * 0.04, right: width * 0.04)
                            : EdgeInsets.only(
                                left: width * 0.04, right: width * 0.04),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.yellow[500]
                                : Colors.red[300],
                            borderRadius: BorderRadius.circular(30.0)),
                        height: height * 0.2,
                        child: Text(menulist[index]),
                      );
                    },
                    itemCount: menulist.length,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, bottom: height * 0.01),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(31.0)),
                  height: height * 0.1 + 12,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                          alignment: Alignment.center,
                          padding: index == 4
                              ? EdgeInsets.only(right: width * 0.06)
                              : EdgeInsets.only(right: 0),
                          margin: index == 0
                              ? EdgeInsets.only(
                                  left: width * 0.06,
                                  top: height * 0.01,
                                  bottom: height * 0.01)
                              : EdgeInsets.only(
                                  left: width * 0.05,
                                  top: height * 0.01,
                                  bottom: height * 0.01),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0)),
                          width: width * 0.6,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 7.0,
                                    color: Colors.black12,
                                    offset: Offset(0, 0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "19",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text("Pending Appointment")
                                  ],
                                ),
                                Icon(
                                  Icons.supervised_user_circle,
                                  color: Colors.blue[900],
                                  size: 32.0,
                                ),
                              ],
                            ),
                          ));
                    },
                    itemCount: menulist.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.06,
                      top: width * 0.02,
                      bottom: width * 0.03),
                  child: Text(
                    "Somethig  New Text..!",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: GridView.builder(
                      padding: EdgeInsets.only(
                          top: height * 0.01,
                          left: width * 0.06,
                          right: width * 0.06),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.1,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(index),
                                ));
                          },
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6.0,
                                      color: Colors.black12,
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(31.0),
                                  color: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    iconlist[index],
                                    color: Colors.blue,
                                    size: 35.0,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(menulist[index])
                                ],
                              )),
                        );
                      },
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics()),
                ),
              )
            ],
          ),
        )));
  }
}
