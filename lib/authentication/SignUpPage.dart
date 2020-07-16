import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lumevents/authentication/LoginPage.dart';
import 'package:regexed_validator/regexed_validator.dart';

import '../theme.dart' as Theme;

final FirebaseAuth mAuth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  final _formKey = GlobalKey<FormState>();

  String email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  void signUpWithEmailAndPassword() async {
    await mAuth
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((AuthResult) async {
      FirebaseUser user = await mAuth.currentUser();

      try {
        await user.sendEmailVerification();
        Fluttertoast.showToast(msg: 'Please verify your email to login');
      } catch (e) {
        Fluttertoast.showToast(msg: 'Error while sending verification email');
      }

      if (user != null) {
        mAuth.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        print('Sign up failed');
      }
    }).catchError((err) {
      if (err.code == "ERROR_EMAIL_ALREADY_IN_USE") {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                    'This email is already registered. Use a different email account.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.MyColors.themeColor),
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
                    'Sign Up',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
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
                  const SizedBox(
                    height: 10.0,
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
                  const SizedBox(
                    height: 10.0,
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
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        email = _emailController.text;
                        signUpWithEmailAndPassword();
                      }
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
}
