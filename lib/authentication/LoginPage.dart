import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lumevents/NavPages/home.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../main.dart';
import '../main.dart';
import 'ForgotPassword.dart';
import 'SignUpPage.dart';
import 'firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth mAuth = FirebaseAuth.instance;

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
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 220.0,
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
                TextFormField(
                  validator: (value) {
                    if (!validator.email(value)) {
                      return 'Invalid email';
                    } else {
                      return null;
                    }
                  },
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
                TextFormField(
                  validator: (value) {
                    if (value.length < 6) {
                      return 'Invalid password (Min. 6 characters are required)';
                    } else {
                      return null;
                    }
                  },
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
                SizedBox(
                  height: 6.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(fontFamily: 'nunito', fontSize: 15.0),
                  ),
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
                    if (_formKey.currentState.validate()) {
                      bool res = await AuthProvider().signInWithEmail(
                          email: _emailController.text,
                          password: _passwordController.text);

                      FirebaseUser user = await mAuth.currentUser();

                      if (user.isEmailVerified) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      } else {
                        Fluttertoast.showToast(
                            msg:
                                'Login failed. (Verify your email if you haven\'t yet)',
                            toastLength: Toast.LENGTH_LONG);
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 6.0,
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
                  height: 8.0,
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
                          Fluttertoast.showToast(
                              msg: 'Login failed',
                              toastLength: Toast.LENGTH_LONG);
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
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
                  height: 180.0,
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
      ),
    );
  }
}
