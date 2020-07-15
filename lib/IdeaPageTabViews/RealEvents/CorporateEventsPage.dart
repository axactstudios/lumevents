import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart' as Theme;

class CorporateEvents extends StatefulWidget {
  @override
  _CorporateEventsState createState() => _CorporateEventsState();
}

class _CorporateEventsState extends State<CorporateEvents> {
  double height, width;
  final scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Theme.MyColors.themeColor,
          ),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/dreamthyeve.png',
                scale: 26,
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 170,
                  child: Text(
                    'Inspirations',
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.MyColors.themeColor,
                        fontFamily: 'nunito'),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ]),
      body: ListView(
        children: [],
      ),
    );
  }
}
