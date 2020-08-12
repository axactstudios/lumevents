import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lumevents/authentication/LoginPage.dart';
import 'package:lumevents/main.dart';
import 'package:lumevents/theme.dart' as Theme;

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  final FirebaseAuth mAuth = FirebaseAuth.instance;
  FirebaseUser mCurrentUser;
  gauntlet() {
    DatabaseReference fuckref = FirebaseDatabase.instance.reference();
    fuckref.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /// Uncomment this in case Aniket ditches us.
            /// The Gauntlet
//            Padding(
//              padding: const EdgeInsets.all(45.0),
//              child: RaisedButton(
//                onPressed: () async {
//                  showDialog(
//                      context: context,
//                      builder: (BuildContext context) {
//                        return AlertDialog(
//                          title: Text("Fuck Aniket"),
//                          content:
//                              Text("Are you sure to fuck Aniket's dream ?"),
//                          actions: [
//                            FlatButton(
//                              child: Text("Cancel"),
//                              onPressed: () {
//                                Navigator.of(context).pop();
//                              },
//                            ),
//                            FlatButton(
//                              child: Text("Yes"),
//                              onPressed: () {
//                                Navigator.of(context).pop();
//                                showDialog(
//                                    context: context,
//                                    builder: (BuildContext context) {
//                                      return AlertDialog(
//                                        title: Text("Fuck Aniket"),
//                                        content: Text("Think once again !!"),
//                                        actions: [
//                                          FlatButton(
//                                            child: Text("Cancel"),
//                                            onPressed: () {
//                                              Navigator.of(context).pop();
//                                            },
//                                          ),
//                                          FlatButton(
//                                            child: Text("I've thought enough!"),
//                                            onPressed: () {
//                                              gauntlet();
//                                              exit(0);
//                                            },
//                                          )
//                                        ],
//                                      );
//                                    });
//                              },
//                            )
//                          ],
//                        );
//                      });
//                },
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(25.0),
//                  side: BorderSide(color: Colors.white),
//                ),
//                color: Theme.MyColors.themeColor,
//                child: Padding(
//                  padding: const EdgeInsets.all(16.0),
//                  child: Text(
//                    'Fuck Aniket\'s dreams !',
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontFamily: 'nunito',
//                        fontWeight: FontWeight.bold,
//                        fontSize: 16),
//                  ),
//                ),
//              ),
//            ),
            Image.asset(
              'images/dreamthyeve.png',
              scale: 10,
            ),
            Image.asset(
              'images/dreamthyeve1.png',
              scale: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(45.0),
              child: RaisedButton(
                onPressed: () async {
                  mCurrentUser = await mAuth.currentUser();
                  mCurrentUser != null
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        )
                      : Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Colors.white),
                ),
                color: Theme.MyColors.themeColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Delivering your dreams !',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
