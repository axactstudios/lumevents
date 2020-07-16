import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lumevents/authentication/LoginPage.dart';
import 'package:lumevents/main.dart';
import 'package:lumevents/theme.dart' as Theme;

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  final FirebaseAuth mAuth = FirebaseAuth.instance;
  FirebaseUser mCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
                    'Explore the magic !',
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
