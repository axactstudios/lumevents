import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 100.0,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "Enter your email"),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: "Enter your password"),
              ),
              const SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Colors.pinkAccent.withOpacity(0.7),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
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
                  }
                },
              ),
              RaisedButton(
                color: Colors.pinkAccent.withOpacity(0.7),
                child: Text(
                  'Login with Google',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  bool res = await AuthProvider().loginWithGoogle();

                  if (!res) {
                    print('Login Failed');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
