import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/doctor/doctorChat.dart';
import 'package:hospital_management/doctor/doctorProfile.dart';

class DoctorHomePage extends StatefulWidget {
  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                DoctorProfile(),
                DoctorChat(),
                DoctorProfile(),
                DoctorProfile()
              ]),
          bottomNavigationBar: FancyBottomNavigation(
            tabs: [
              TabData(
                iconData: Icons.home,
                title: "Home",
              ),
              TabData(
                iconData: Icons.message_outlined,
                title: "Search",
              ),
              TabData(iconData: Icons.shopping_cart, title: "Basket"),
              TabData(
                  iconData: Icons.supervised_user_circle_outlined,
                  title: "Account")
            ],
            onTabChangedListener: (position) {
              setState(() {
                _tabController.index = position;
              });
            },
          )),
    );
  }
}
