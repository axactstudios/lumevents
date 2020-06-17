import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lumevents/main.dart';
import 'package:lumevents/profilePage/ProfileSetup.dart';
import 'package:regexed_validator/regexed_validator.dart';

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
    AuthResult res = await mAuth.createUserWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);

    if (res != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileSetup()),
      );
    } else {
      print('Sign up failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 240.0,
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
                        hintStyle: TextStyle(
                            color: Color(0xFFFF124D),
                            fontFamily: 'nunito',
                            fontWeight: FontWeight.bold),
                        hintText: "Enter your email"),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.length < 6) {
                        return 'Invalid password (Min. 6 characters are required';
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
                        hintStyle: TextStyle(
                            color: Color(0xFFFF124D),
                            fontFamily: 'nunito',
                            fontWeight: FontWeight.bold),
                        hintText: "Enter your password (min. 6 characters)"),
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
