import 'package:flutter/material.dart';
import 'package:lumevents/NavPages/home.dart';
import '../main.dart';
import 'SignUpPage.dart';
import 'firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 230.0,
              ),
              Text(
                'Login to your account',
                style: TextStyle(
                  color: Color(0xFFFF124D),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: 'nunito',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 5.0,
                width: 210.0,
                child: Divider(
                  thickness: 0.8,
                  color: Color(0xFFFF124D),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  filled: false,
                  hintStyle: TextStyle(
                      color: Color(0xFFFF124D),
                      fontFamily: 'nunito',
                      fontWeight: FontWeight.bold),
                  hintText: "Enter your email",
                  fillColor: Colors.pinkAccent.shade200.withOpacity(0.7),
                ),
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
                    filled: false,
                    hintStyle: TextStyle(
                        color: Color(0xFFFF124D),
                        fontFamily: 'nunito',
                        fontWeight: FontWeight.bold),
                    hintText: "Enter your password",
                    fillColor: Colors.pinkAccent),
              ),
              const SizedBox(
                height: 15.0,
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
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    print('Email and password cannot be empty');
                    return;
                  }
                  bool res = await AuthProvider().signInWithEmail(
                      email: _emailController.text,
                      password: _passwordController.text);

                  if (!res) {
                    print('Login failed');
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  }
                },
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 125.5,
                    child: Divider(
                      color: Color(0xFFFF124D),
                    ),
                    height: 5.0,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    'Other methods',
                    style: TextStyle(
                      color: Color(0xFFFF124D),
                      fontFamily: 'nunito',
                    ),
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  SizedBox(
                    width: 125.5,
                    child: Divider(
                      color: Color(0xFFFF124D),
                    ),
                    height: 5.0,
                  ),
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.white),
                    ),
                    color: Color(0xFFFF124D),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Google',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    onPressed: () async {
                      bool res = await AuthProvider().loginWithGoogle();

                      if (!res) {
                        print('Login Failed');
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      }
                    },
                  ),
                  SizedBox(
                    width: 0.2,
                    child: Divider(
                      thickness: 2.0,
                    ),
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
                        'Phone',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(
                height: 210.0,
              ),
              Divider(
                thickness: 1.8,
                color: Color(0xFFFF124D),
              ),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFFF124D),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'New User? Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
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
