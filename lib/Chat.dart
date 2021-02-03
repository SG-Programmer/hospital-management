import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';
import 'utils/size.dart';

chat(NetworkImage profilePhoto) {
  return Padding(
    padding: EdgeInsets.only(top: screenHeight * 0.02),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: profilePhoto,
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
    ),
  );
}
