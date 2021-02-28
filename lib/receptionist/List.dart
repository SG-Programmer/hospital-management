import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';

listOfCard(var _appoinmentList, var _appoinmentUserDatail) {
  return Center(
    child: ListView.builder(
      itemCount: _appoinmentList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(
              top: screenHeight * 0.01 + 4,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blue[400]),
          child: Padding(
            padding: EdgeInsets.all(screenHeight * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.supervised_user_circle,
                      size: screenHeight * 0.06,
                    ),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _appoinmentUserDatail[index].firstName +
                              " " +
                              _appoinmentUserDatail[index].lastName,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500),
                        ),
                        Text(_appoinmentUserDatail[index].number),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Time:-" + _appoinmentList[index].time),
                    Text("Token No:-" +
                        _appoinmentList[index].tokeNumber.toString())
                  ],
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
