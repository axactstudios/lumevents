import 'package:flutter/material.dart';
import 'package:lumevents/NavPages/Wishlist.dart';

import '../theme.dart' as Theme;

class PlanPage extends StatefulWidget {
  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.MyColors.themeColor.withOpacity(0.7),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Wishlist()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.format_list_numbered,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.MyColors.themeColor.withOpacity(0.3),
    );
  }
}
