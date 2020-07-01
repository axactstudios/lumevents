import 'package:flutter/material.dart';
import 'package:lumevents/WeddingsPage.dart';

class IdeasTab extends StatefulWidget {
  @override
  _IdeasTabState createState() => _IdeasTabState();
}

final scaffoldState = GlobalKey<ScaffoldState>();

class _IdeasTabState extends State<IdeasTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldState,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
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
              Card(
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
              Card(
                color: Colors.pinkAccent,
                elevation: 8,
                child: Container(
                  height: 50,
                  child: Center(
                      child: Text('Special Events',
                          style: TextStyle(color: Colors.white))),
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
