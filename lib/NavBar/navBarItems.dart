import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

List<PersistentBottomNavBarItem> navBarItems = [
  PersistentBottomNavBarItem(
    icon: Icon(FontAwesomeIcons.home),
    title: ("Home"),
    activeColor: Color(0xFFFF0060),
    inactiveColor: Colors.black87,
  ),
  PersistentBottomNavBarItem(
    icon: Icon(FontAwesomeIcons.lightbulb),
    title: ("Ideas"),
    activeColor: Color(0xFFFF0060),
    inactiveColor: Colors.black87,
  ),
  PersistentBottomNavBarItem(
    icon: Icon(FontAwesomeIcons.tasks),
    title: ("Plan"),
    activeColor: Color(0xFFFF0060),
    inactiveColor: Colors.black87,
  ),
  PersistentBottomNavBarItem(
    icon: Icon(FontAwesomeIcons.cog),
    title: ("More"),
    activeColor: Color(0xFFFF0060),
    inactiveColor: Colors.black87,
  ),
];
