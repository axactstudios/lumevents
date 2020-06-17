import 'package:flutter/material.dart';
import 'package:lumevents/MainPage.dart';
import 'package:lumevents/NavBar/navBarItems.dart';
import 'package:lumevents/NavPages/Profile.dart';
import 'package:lumevents/NavPages/home.dart';
import 'package:lumevents/NavPages/ideas.dart';
import 'package:lumevents/NavPages/more.dart';
import 'package:lumevents/NavPages/plan.dart';
import 'package:lumevents/profilePage/ProfilePage.dart';
import 'package:persistent_bottom_nav_bar/models/persistent-bottom-nav-bar-styles.widget.dart';
import 'package:persistent_bottom_nav_bar/models/persistent-nav-bar-scaffold.widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'MainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: MainPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      items: navBarItems,
      screens: _buildScreens(),
      showElevation: true,
      navBarCurve: NavBarCurve.upperCorners,
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      iconSize: 26.0,
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property
      onItemSelected: (index) {
        print(index);
      },
    );
  }

  List<Widget> _buildScreens() {
    return [HomePage(), IdeasPage(), PlanPage(), MorePage()];
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
