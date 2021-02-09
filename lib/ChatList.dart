import 'package:flutter/material.dart';
import 'package:hospital_management/utils/size.dart';
import 'ChatPage.dart';
import 'utils/size.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<IconData> profileList = [
    Icons.add_circle_outline,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
    Icons.supervised_user_circle,
  ];

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
  bool allButtonColor = true;
  bool doctorButtonColor = false;
  bool patientButoonColor = false;
  @override
  Widget build(BuildContext context) {
    ScreenSize.setSize(context);
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.3,
          color: Color(0xff465efc),
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
              left: screenWidth * 0.05, top: screenHeight * 0.09),
          child: Text(
            "Chats",
            style: TextStyle(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.3),
          child: Container(
            padding: EdgeInsets.only(
                top: screenHeight * 0.05, left: screenWidth * 0.06),
            height: screenHeight * 0.8,
            width: double.infinity,
            color: Color(0xfff5f6f1),
            child: ListView.builder(
              itemCount: profileList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatPage("Dr.Jatin Patel", profilePhoto[index]),
                        ));
                  },
                  child: chat(profilePhoto[index]),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.2 - 27),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(23.0)),
            height: screenHeight * 0.2,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.1 + 25,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: profileList.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: screenWidth * 0.04),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.02),
                        child: CircleAvatar(
                          radius: 31,
                          backgroundImage: profilePhoto[index],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.06, top: screenHeight * 0.01),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            allButtonColor = true;
                            doctorButtonColor = false;
                            patientButoonColor = false;
                          });
                        },
                        child: Text(
                          "All",
                          style: TextStyle(
                              fontSize: 19.0,
                              color: allButtonColor
                                  ? Colors.blue
                                  : Colors.black54),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            allButtonColor = false;
                            doctorButtonColor = true;
                            patientButoonColor = false;
                          });
                        },
                        child: Text("Doctor",
                            style: TextStyle(
                                fontSize: 19.0,
                                color: doctorButtonColor
                                    ? Colors.blue
                                    : Colors.black54)),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            allButtonColor = false;
                            doctorButtonColor = false;
                            patientButoonColor = true;
                          });
                        },
                        child: Text("Patient",
                            style: TextStyle(
                                fontSize: 19.0,
                                color: patientButoonColor
                                    ? Colors.blue
                                    : Colors.black54)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

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
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
              Text("Dr_JR_Patel")
            ],
          )
        ],
      ),
    );
  }
}
