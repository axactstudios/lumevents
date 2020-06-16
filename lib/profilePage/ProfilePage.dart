import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lumevents/profilePage/User.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../authentication/LoginPage.dart';
import '../authentication/LoginPage.dart';
import 'ProfileSetup.dart';
import 'ProfileSetup.dart';
import 'User.dart';
import 'User.dart';
import 'User.dart';
import 'User.dart';
import 'User.dart';
import 'User.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final dbRef = FirebaseDatabase.instance.reference().child('Users');
  final FirebaseAuth mAuth = FirebaseAuth.instance;

  User userData = User();

  @override
  void initState() {
    super.initState();
    getDatabaseRef();
  }

  getDatabaseRef() async {
    FirebaseUser user = await mAuth.currentUser();
    String uid = user.uid;
    var ref = dbRef.child(uid);
    DatabaseReference dbref =
        FirebaseDatabase.instance.reference().child('Users').child(uid);
    await dbref.once().then((DataSnapshot snap) async {
      // ignore: non_constant_identifier_names
      userData.name = await snap.value['name'];
      userData.number = await snap.value['number'];
      userData.email = await snap.value['email'];
      userData.role = await snap.value['role'];
      setState(() {});
    });
  }

//  var ref;    //Working code 1 starts
//
//  @override
//  void initState() {
//    super.initState();
//    getData();
//  }
//
//  void getData() async {
//    FirebaseUser user = await mAuth.currentUser();
//    String uid = user.uid;
//    var ref = dbRef.child(uid);
//
//    await ref.once().then((DataSnapshot snapshot) async {
//      Map<dynamic, dynamic> values = snapshot.value;
//      values.forEach((key, value) {
//        userData.name = values['name'].toString();
//        userData.number = values['number'].toString();
//        userData.email = values['email'].toString();
//        userData.role = values['role'].toString();
//        sleep(
//          Duration(seconds: 2),
//        );
//      });
//    });
//  }

//  User userData = User(); //Working code 2 starts here
//
//  Future getData() async {
//    FirebaseUser user = await mAuth.currentUser();
//    String uid = user.uid;
//    var ref = dbRef.child(uid);
//
//    await ref.once().then((DataSnapshot snapshot) async {
//      setState(() async {
//        userData.name = await snapshot.value['name'];
//        userData.number = await snapshot.value['number'];
//        userData.email = await snapshot.value['email'];
//        userData.role = await snapshot.value['role'];
//      });
//    });
//  }
//
//  void checkState() {
//    if (userData.name == null) {
//      userData.name = 'Loading';
//      userData.number = 'Loading';
//      userData.email = 'Loading';
//      userData.role = 'Loading';
//    }
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    getData();
//    checkState();
//  }                         //Working code ends here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.withOpacity(0.7),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    'Your Profile',
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: Colors.pinkAccent),
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.pinkAccent,
                      thickness: 0.5,
                    ),
                    width: 150.0,
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  userData.name != null
                      ? Card(
                          color: Colors.pinkAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' :   ',
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
//                          userData.name == null
//                              ? CircularProgressIndicator()
//                              : userData.name,
                                Text(
                                  userData.name,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: SpinKitWave(
                            size: 30,
                            color: Colors.pinkAccent.withOpacity(0.7),
                          ),
                        ),
                  SizedBox(
                    height: 15.0,
                  ),
                  userData.number != null
                      ? Card(
                          color: Colors.pinkAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' :   ',
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
//                          userData.number == null
//                              ? CircularProgressIndicator()
//                              : userData.number,
                                Text(
                                  userData.number,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: SpinKitWave(
                            size: 30,
                            color: Colors.pinkAccent.withOpacity(0.7),
                          ),
                        ),
                  SizedBox(
                    height: 15.0,
                  ),
                  userData.email != null
                      ? Card(
                          color: Colors.pinkAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' :   ',
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
//                          userData.email == null
//                              ? CircularProgressIndicator()
//                              : userData.email,
                                Text(
                                  userData.email,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: SpinKitWave(
                            size: 30,
                            color: Colors.pinkAccent.withOpacity(0.7),
                          ),
                        ),
                  SizedBox(
                    height: 15.0,
                  ),
                  userData.role != null
                      ? Card(
                          color: Colors.pinkAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.pages,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' :   ',
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
//                          userData.role == null
//                              ? CircularProgressIndicator()
//                              : userData.role,
                                Text(
                                  userData.role,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: SpinKitWave(
                            size: 30,
                            color: Colors.pinkAccent.withOpacity(0.7),
                          ),
                        ),
                  SizedBox(
                    height: 200.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.white),
                        ),
                        color: Colors.pinkAccent,
                        onPressed: () {
                          pushNewScreen(context,
                              screen: ProfileSetup(), withNavBar: false);
                        },
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.white),
                        ),
                        color: Colors.pinkAccent,
                        onPressed: () {
                          signOut();
                        },
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signOut() {
    mAuth.signOut();
    pushNewScreen(context, screen: LoginPage(), withNavBar: false);
//    Navigator.pushReplacement(
//      context,
//      MaterialPageRoute(builder: (context) => LoginPage()),
  }
}
