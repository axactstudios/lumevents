import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lumevents/NavPages/planWidgets/formFields.dart';
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
                    'Edit Profile',
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              FormFields(_nameController, 'Your Name'),
              FormFields(_numberController, 'Your Phone Number'),
              FormFields(_emailController, "Your Email"),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100.0, vertical: 8),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Theme.MyColors.themeColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
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
              ),
            ],
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
