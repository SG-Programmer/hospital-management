import 'package:flutter/material.dart';

class Complite extends StatefulWidget {
  @override
  _CompliteState createState() => _CompliteState();
}

class _CompliteState extends State<Complite> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  top: height * 0.01 + 4,
                  left: width * 0.05,
                  right: width * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue[400]),
              child: Padding(
                padding: EdgeInsets.all(height * 0.02),
                child: Row(
                  children: [
                    Icon(
                      Icons.supervised_user_circle,
                      size: height * 0.06,
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Column(
                      children: [
                        Text(
                          "Parth Kevadiya",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500),
                        ),
                        Text("+919955668844"),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: 8),
    );
  }
}
