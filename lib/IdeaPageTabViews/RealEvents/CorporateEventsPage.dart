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
        backgroundColor: Theme.MyColors.themeColor.withOpacity(0.7),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
