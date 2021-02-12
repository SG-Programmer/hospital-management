import 'package:flutter/material.dart';
import 'package:hospital_management/common/doctorscreen/DoctorDatailPage.dart';
import 'package:hospital_management/utils/size.dart';
import 'package:hospital_management/common/doctorDatailsList.dart';

class SearchPage extends StatefulWidget {
  String searchWord;
  SearchPage(this.searchWord);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    searchController.text = widget.searchWord;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.04, top: screenHeight * 0.02),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.black12,
                ),
                height: screenHeight * 0.06,
                width: screenWidth * 0.9,
                child: TextField(
                  autofocus: true,
                  controller: searchController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: "Search your symptoms..",
                      prefixIcon: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: nameOfDoctor.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(
                          left: screenWidth * 0.06, right: screenWidth * 0.06),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: profilePhoto[index],
                      ),
                      title: Text("Heart"),
                      subtitle: Text(nameOfDoctor[index]),
                      trailing: Text("09:00 AM - 02:00 PM"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorDatailPage(
                                doctorPhoto: profilePhoto[index],
                                nameOfDoctor: nameOfDoctor[index],
                              ),
                            ));
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
