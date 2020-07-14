import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lumevents/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:regexed_validator/regexed_validator.dart';

import '../theme.dart' as Theme;

class ProfileSetup extends StatefulWidget {
  @override
  _ProfileSetupState createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final dbRef = FirebaseDatabase.instance.reference();
  final FirebaseAuth mAuth = FirebaseAuth.instance;

  TextEditingController _nameController;
  TextEditingController _numberController;
  TextEditingController _emailController;

  final _formKey = GlobalKey<FormState>();

  var _selection = ['Bride', 'Groom', 'Other'];
  String role;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text: "");
    _numberController = TextEditingController(text: "+91");
    _emailController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 250.0,
                ),
                Text(
                  'Set up your profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'nunito',
                    color: Theme.MyColors.themeColor,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                  width: 175.0,
                  child: Divider(
                    thickness: 0.8,
                    color: Theme.MyColors.themeColor,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your name';
                    } else {
                      return null;
                    }
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                      hintStyle: TextStyle(
                          color: Theme.MyColors.themeColor,
                          fontFamily: 'nunito',
                          fontWeight: FontWeight.bold),
                      hintText: "Enter your full name"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.length < 13) {
                      return 'Invalid phone number';
                    } else {
                      return null;
                    }
                  },
                  controller: _numberController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                      hintStyle: TextStyle(
                          color: Theme.MyColors.themeColor,
                          fontFamily: 'nunito',
                          fontWeight: FontWeight.bold),
                      hintText: "Enter your contact number"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (!validator.email(value)) {
                      return 'Invalid Email';
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
                          color: Theme.MyColors.themeColor,
                          fontFamily: 'nunito',
                          fontWeight: FontWeight.bold),
                      hintText: "Enter your email"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Select your role :',
                      style: TextStyle(
                          fontFamily: 'nunito',
                          color: Theme.MyColors.themeColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    DropdownButton<String>(
                      items: _selection.map((String dropdownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropdownStringItem,
                          child: Text(
                            dropdownStringItem,
                            style: TextStyle(
                                fontFamily: 'nunito',
                                color: Theme.MyColors.themeColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          role = newValueSelected;
                        });
                      },
                      value: role,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
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
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'nunito',
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      writeData();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void writeData() async {
    final FirebaseUser user = await mAuth.currentUser();
    String uid = user.uid;
    dbRef.child('Users').child(uid).set({
      'name': _nameController.text,
      'number': _numberController.text,
      'email': _emailController.text,
      'role': role
    });
  }
}
