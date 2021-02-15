import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

class PatientProfilePage extends StatefulWidget {
  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomPaint(
          painter: RPSCustomPainter(),
          child: Container(
            height: screenHeight * 0.4,
            width: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.03, top: screenHeight * 0.04 - 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Alex Goshli",
                          style: TextStyle(color: Colors.white, fontSize: 22)),
                      SizedBox(
                        height: screenHeight * 0.01 - 5,
                      ),
                      Text("alexgoshli@gmail.com",
                          style: TextStyle(color: Colors.white, fontSize: 11.4))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.4 - 11,
                      top: screenHeight * 0.1 + 38),
                  child: CircleAvatar(
                    radius: screenHeight * 0.07,
                    child: Icon(
                      Icons.supervised_user_circle_outlined,
                      size: 99,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.02, top: screenHeight * 0.2),
                      child: CircleAvatar(
                          radius: screenHeight * 0.05 + 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("72",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25)),
                              Text("Heart Bit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.3),
                      child: CircleAvatar(
                          radius: screenHeight * 0.05 + 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("85%",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25)),
                              Text("Health",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: screenWidth * 0.02, top: screenHeight * 0.2),
                      child: CircleAvatar(
                          radius: screenHeight * 0.05 + 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("52%",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25)),
                              Text("Blood Level",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 243, 125)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(0, size.height * 0.67);
    path_0.quadraticBezierTo(size.width * 0.37, size.height * 0.93,
        size.width * 0.51, size.height * 0.90);
    path_0.quadraticBezierTo(size.width * 0.62, size.height * 0.93,
        size.width * 1.01, size.height * 0.67);
    path_0.lineTo(size.width * 1.01, 0);

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_1 = Path();
    path_1.moveTo(size.width * -0.00, size.height * 0.01);
    path_1.lineTo(size.width * -0.00, size.height * 0.34);
    path_1.quadraticBezierTo(size.width * 0.38, size.height * 0.60,
        size.width * 0.50, size.height * 0.57);
    path_1.quadraticBezierTo(size.width * 0.63, size.height * 0.61,
        size.width * 1.01, size.height * 0.33);
    path_1.lineTo(size.width * 1.01, 0);

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
