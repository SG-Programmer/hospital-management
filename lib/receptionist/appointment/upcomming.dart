import 'package:flutter/material.dart';

class Upcomming extends StatefulWidget {
  @override
  _UpcommingState createState() => _UpcommingState();
}

class _UpcommingState extends State<Upcomming> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
        child: Container(
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        color: Colors.black26,
                        offset: Offset(0, 0))
                  ],
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(20.0)),
              margin: EdgeInsets.only(
                  top: height * 0.02, left: width * 0.06, right: width * 0.06),
              height: height * 0.2 - 40,
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.02, left: width * 0.03),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.supervised_user_circle,
                          size: height * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.03),
                          child: Column(
                            children: [
                              Text(
                                "Harsh Shekhadiya",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: height * 0.01 - 5),
                              Text(
                                "+91992266448574",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.01, left: width * 0.1 + 10),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: width * 0.03),
                            width: width * 0.2 + 19,
                            height: height * 0.04 + 7,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.blue[800]),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Accept"),
                            ),
                          ),
                          Container(
                            width: width * 0.2 + 19,
                            height: height * 0.04 + 7,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.red[800]),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Decline",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
