import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lumevents/NavPages/home.dart';
import 'package:lumevents/main.dart';

final FirebaseAuth mAuth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController;

  TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  void signUpWithEmailAndPassword() async {
    AuthResult res = await mAuth.createUserWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);

    if (res != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      print('Sign up failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 300.0,
            ),
            Text(
              'Sign up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'nunito',
                color: Color(0xFFFF124D),
              ),
            ),
            const SizedBox(
              height: 10.0,
              width: 75.0,
              child: Divider(
                thickness: 0.8,
                color: Color(0xFFFF124D),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  hintStyle: TextStyle(
                      color: Color(0xFFFF124D),
                      fontFamily: 'nunito',
                      fontWeight: FontWeight.bold),
                  hintText: "Enter your email"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  hintStyle: TextStyle(
                      color: Color(0xFFFF124D),
                      fontFamily: 'nunito',
                      fontWeight: FontWeight.bold),
                  hintText: "Enter your password"),
            ),
            const SizedBox(
              height: 10.0,
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
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              onPressed: () async {
                if (_emailController.text == null ||
                    _passwordController.text == null) {
                  print('Email and password cannot be empty');
                  return;
                } else {
                  signUpWithEmailAndPassword();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
