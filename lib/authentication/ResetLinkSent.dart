import 'package:flutter/material.dart';
import 'package:lumevents/authentication/LoginPage.dart';

class ResetLinkSent extends StatefulWidget {
  @override
  _ResetLinkSentState createState() => _ResetLinkSentState();
}

class _ResetLinkSentState extends State<ResetLinkSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 240.0,
              ),
              Image(
                image: AssetImage('images/checkmark.png'),
                height: 220,
                width: 220,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Password reset link sent',
                style: TextStyle(fontFamily: 'nunito', fontSize: 22.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFFF124D),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                onPressed: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
