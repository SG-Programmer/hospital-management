import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

chat() {
  return Row(
    children: [
      Icon(
        Icons.supervised_user_circle_outlined,
        size: 55.0,
      ),
      SizedBox(
        width: screenWidth * 0.03,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Dr.Jatin Radadiya",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
          Text("Dr_JR_Patel")
        ],
      )
    ],
  );
}
