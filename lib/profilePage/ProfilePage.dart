import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lumevents/profilePage/User.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../authentication/LoginPage.dart';
import '../theme.dart' as Theme;
import 'ProfileSetup.dart';
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

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.MyColors.themeColor),
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset(
            'images/dreamthyeve.png',
            scale: 26,
          ),
          Container(
            width: 200,
            child: Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 22,
                  color: Theme.MyColors.themeColor,
                  fontFamily: 'nunito'),
              textAlign: TextAlign.left,
            ),
          )
        ]),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: userData.name != null
                    ? ListView(
                        children: <Widget>[
                          SizedBox(
                            height: pHeight * 0.015,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme.MyColors.themeColor, width: 1.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 6,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'images/person.png',
                                    height: pHeight * 0.12,
                                  ),
                                  SizedBox(
                                    height: pHeight * 0.01,
                                  ),
                                  Text(
                                    userData.name,
                                    style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontSize: pHeight * 0.025,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.MyColors.themeColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: pHeight * 0.02,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme.MyColors.themeColor, width: 1.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 6,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'images/phone(.png',
                                    height: pHeight * 0.12,
                                  ),
                                  SizedBox(
                                    height: pHeight * 0.01,
                                  ),
                                  Text(
                                    userData.number,
                                    style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontSize: pHeight * 0.024,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.MyColors.themeColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: pHeight * 0.02,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme.MyColors.themeColor, width: 1.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 6,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'images/email.png',
                                    height: pHeight * 0.12,
                                  ),
                                  SizedBox(
                                    height: pHeight * 0.01,
                                  ),
                                  Text(
                                    userData.email,
                                    style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontSize: pHeight * 0.025,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.MyColors.themeColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: pHeight * 0.02,
                          ),
                        ],
                      )
                    : Center(
                        child: SpinKitWave(
                          size: 30,
                          color: Theme.MyColors.themeColor.withOpacity(0.7),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Theme.MyColors.themeColor),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        pushNewScreen(context,
                            screen: ProfileSetup(), withNavBar: false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Theme.MyColors.themeColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signOut() {
    mAuth.signOut();
    pushNewScreen(context, screen: LoginPage(), withNavBar: false);
  }
}
