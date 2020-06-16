import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lumevents/profilePage/User.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final dbRef = FirebaseDatabase.instance.reference().child('Users');
  final FirebaseAuth mAuth = FirebaseAuth.instance;

  User userData = User();

  Future getData() async {
    FirebaseUser user = await mAuth.currentUser();
    String uid = user.uid;
    var ref = dbRef.child(uid);

    await ref.once().then((DataSnapshot snapshot) {
      userData.name = snapshot.value['name'];
      userData.number = snapshot.value['number'];
      userData.email = snapshot.value['email'];
      userData.role = snapshot.value['role'];
    });
  }

  void checkState() {
    if (userData.name == null) {
      userData.name = 'Loading';
      userData.number = 'Loading';
      userData.email = 'Loading';
      userData.role = 'Loading';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    checkState();
  }

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
                  Card(
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
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Card(
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
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Card(
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
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Card(
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
