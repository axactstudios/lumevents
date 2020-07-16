import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lumevents/NavPages/home.dart';
import 'package:lumevents/NavPages/planWidgets/formFields.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../main.dart';
import '../main.dart';
import '../theme.dart' as Theme;
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
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/dreamthyeve.png',
                scale: 26,
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 170,
                  child: Text(
                    'Login',
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.MyColors.themeColor,
                        fontFamily: 'nunito'),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ]),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19.5, vertical: 15.0),
                    child: TextFormField(
                      controller: _emailController,
                      cursorColor: Colors.black,
                      decoration: new InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Enter your email",
                          hintStyle:
                              TextStyle(color: Theme.MyColors.themeColor)),
                      validator: (value) {
                        if (!validator.email(value)) {
                          return 'Invalid email';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19.5, vertical: 15.0),
                    child: TextFormField(
                      controller: _passwordController,
                      cursorColor: Colors.black,
                      decoration: new InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Enter your password",
                          hintStyle:
                              TextStyle(color: Theme.MyColors.themeColor)),
                      validator: (value) {
                        if (value.length < 6) {
                          return 'Invalid password (Min. 6 characters are required)';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: 'nunito',
                          fontSize: 15.0),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.white),
                    ),
                    color: Theme.MyColors.themeColor,
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
                        signIn();
                      }
                    },
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 15),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Theme.MyColors.themeColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              'Login with Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'nunito',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
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
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.white),
                    ),
                    color: Theme.MyColors.themeColor,
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
      ),
    );
  }

  void signIn() async {
    mAuth
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((AuthResult) async {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();

      if (!user.isEmailVerified) {
        Fluttertoast.showToast(
            msg: 'Please verify your email to continue',
            toastLength: Toast.LENGTH_LONG);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      }
    }).catchError((err) {
      if (err.code == "ERROR_USER_NOT_FOUND") {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                    'This email is not yet registered. Please sign up first.'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
      if (err.code == "ERROR_WRONG_PASSWORD") {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title:
                    Text('Wrong password. Please enter the correct password.'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
      if (err.code == "ERROR_NETWORK_REQUEST_FAILED") {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                    'Your internet connection is either too slow or not available.'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    });
  }
}
