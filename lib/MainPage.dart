import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lumevents/authentication/LoginPage.dart';
import 'package:lumevents/main.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  final FirebaseAuth mAuth = FirebaseAuth.instance;
  FirebaseUser mCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('images/background2.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 550),
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
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => LoginPage()),
//                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFFF124D),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Explore the magic of Lum Events',
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
