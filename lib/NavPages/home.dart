import 'package:flutter/material.dart';
import 'package:lumevents/NavPages/more.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: FlatButton(
          color: Colors.red,
          child: Text('Go To Next'),
          onPressed: () {
            pushNewScreen(
              context,
              screen: MorePage(),
              platformSpecific:
                  false, // OPTIONAL VALUE. False by default, which means the bottom nav bar will persist
              withNavBar: true, // OPTIONAL VALUE. True by default.
            );
          },
        ),
      ),
    );
  }
}
