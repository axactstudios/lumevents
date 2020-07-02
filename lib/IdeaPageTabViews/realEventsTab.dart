import 'package:flutter/material.dart';
import 'package:lumevents/IdeaPageTabViews/RealEvents/SpecialEventsPage.dart';
import 'package:lumevents/IdeaPageTabViews/RealEvents/birthdayPage.dart';

import 'RealEvents/WeddingsPage.dart';

class RealEventsTab extends StatefulWidget {
  @override
  _RealEventsTabState createState() => _RealEventsTabState();
}

class _RealEventsTabState extends State<RealEventsTab> {
  double height, width;
  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: scaffoldState,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Weddings()),
                  );
                },
                child: Card(
                  color: Colors.pinkAccent,
                  elevation: 8,
                  child: Container(
                    height: 50,
                    child: Center(
                        child: Text(
                      'Weddings',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Birthdays()),
                  );
                },
                child: Card(
                  color: Colors.pinkAccent,
                  elevation: 8,
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text('Birthday Parties',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.pinkAccent,
                elevation: 8,
                child: Container(
                  height: 50,
                  child: Center(
                      child: Text('Corporate Events',
                          style: TextStyle(color: Colors.white))),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SpecialEvents()),
                  );
                },
                child: Card(
                  color: Colors.pinkAccent,
                  elevation: 8,
                  child: Container(
                    height: 50,
                    child: Center(
                        child: Text('Special Events',
                            style: TextStyle(color: Colors.white))),
                  ),
                ),
              ),
              Card(
                color: Colors.pinkAccent,
                elevation: 8,
                child: Container(
                  height: 50,
                  child: Center(
                      child:
                          Text('Other', style: TextStyle(color: Colors.white))),
                ),
              ),
            ],
          ),
        ));
  }
}
