import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
        bottomNavigationBar: FancyBottomNavigation(
      tabs: [
        TabData(
          iconData: Icons.home,
          title: "Home",
        ),
        TabData(
          iconData: Icons.search,
          title: "Search",
        ),
        TabData(iconData: Icons.shopping_cart, title: "Basket")
      ],
      onTabChangedListener: (position) {
        setState(() {
          _tabController.index = position;
        });
      },
    ));
  }
}
