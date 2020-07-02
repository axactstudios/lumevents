import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:lumevents/IdeaPageTabViews/realEventsTab.dart';

class IdeasPage extends StatefulWidget {
  @override
  _IdeasPageState createState() => _IdeasPageState();
}

class _IdeasPageState extends State<IdeasPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GFTabs(
      tabBarColor: Color(0xFFFF4B8F),
      tabBarHeight: 70,
      indicatorColor: Colors.white,
      initialIndex: 0,
      length: 1,
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.only(
//              bottomRight: Radius.circular(10),
//              bottomLeft: Radius.circular(10))),
      tabs: <Widget>[
        Tab(
          child: Text(
            "Real Events",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "nunito",
            ),
          ),
        ),
      ],
      tabBarView: GFTabBarView(
        children: <Widget>[RealEventsTab()],
      ),
    ));
  }
}
