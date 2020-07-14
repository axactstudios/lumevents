import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lumevents/authentication/ResetLinkSent.dart';
import 'package:regexed_validator/regexed_validator.dart';

import '../theme.dart' as Theme;

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController;
  final FirebaseAuth mAuth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController(text: "");
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 300.0,
                  ),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontWeight: FontWeight.bold,
                        color: Theme.MyColors.themeColor,
                        fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 5.0,
                    width: 160.0,
                    child: Divider(
                      thickness: 0.8,
                      color: Theme.MyColors.themeColor,
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
                          color: Theme.MyColors.themeColor,
                          fontFamily: 'nunito',
                          fontWeight: FontWeight.bold),
                      hintText: "Enter your email",
                      fillColor: Theme.MyColors.themeColor.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.white),
                    ),
                    color: Theme.MyColors.themeColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Send password reset link',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await mAuth.sendPasswordResetEmail(
                            email: _emailController.text);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetLinkSent()),
                        );
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
