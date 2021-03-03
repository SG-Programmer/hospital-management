import 'package:flutter/material.dart';
import 'package:hospital_management/receptionist/PatientDatails.dart';
import 'package:hospital_management/utils/size.dart';

listOfCard(var _appoinmentList, var _appoinmentUserDatail) {
  return Center(
    child: ListView.builder(
      itemCount: _appoinmentList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientDatails(
                    userName: _appoinmentUserDatail[index].userNameP ??
                        _appoinmentUserDatail[index].firstNameP,
                    firstName: _appoinmentUserDatail[index].firstNameP,
                    lastName: _appoinmentUserDatail[index].lastNameP,
                    email: _appoinmentUserDatail[index].emailP ?? "Null",
                    number: _appoinmentUserDatail[index].numberP,
                    date: _appoinmentUserDatail[index].brithDateP,
                    address: _appoinmentUserDatail[index].addressP,
                  ),
                ));
          },
          child: Container(
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
                            _appoinmentUserDatail[index].firstNameP +
                                " " +
                                _appoinmentUserDatail[index].lastNameP,
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w500),
                          ),
                          Text(_appoinmentUserDatail[index].numberP),
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
          ),
        );
      },
    ),
  );
}
