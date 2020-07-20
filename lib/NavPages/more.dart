import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lumevents/MainPage.dart';
import 'package:lumevents/authentication/LoginPage.dart';
import 'package:lumevents/profilePage/ProfilePage.dart';
import 'package:lumevents/profilePage/ProfileSetup.dart';
import 'package:lumevents/profilePage/User.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart' as Theme;

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final FirebaseAuth mAuth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.reference().child('Users');
  FirebaseUser mCurrentUser;

  User userData = User();

  void getSnap() async {
    FirebaseUser user = await mAuth.currentUser();
    String uid = user.uid;
    DatabaseReference dbref =
        FirebaseDatabase.instance.reference().child('Users').child(uid);
    await dbref.once().then((DataSnapshot snap) async {
      // ignore: non_constant_identifier_names
      userData.name = await snap.value['name'];
    });
  }

  bool doesExist() {
    if (userData.name != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getSnap();
  }

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
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
                  width: 220,
                  child: Text(
                    'More Options',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () async {
                  final FirebaseUser user = await mAuth.currentUser();

                  mCurrentUser = await mAuth.currentUser();
                  mCurrentUser != null
// ignore: unnecessary_statements
                      ? (doesExist()
                          ? pushNewScreen(context,
                              screen: ProfilePage(), withNavBar: true)
                          : pushNewScreen(context,
                              screen: ProfileSetup(), withNavBar: false))
                      : pushNewScreen(context,
                          screen: LoginPage(), withNavBar: false);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: pHeight * 0.025,
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Container(
                          child: Text(
                            'Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: pHeight * 0.025,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: pHeight * 0.02,
              ),
              InkWell(
                onTap: () {
                  FlutterOpenWhatsapp.sendSingleMessage("919836262656",
                      "Hello! I am a user of your supercool application.");
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.headset_mic,
                          color: Colors.white,
                          size: pHeight * 0.025,
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Container(
                          child: Text(
                            'Contact Support',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: pHeight * 0.025,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: pHeight * 0.02,
              ),
              InkWell(
                onTap: () {
                  _launchURL();
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.googlePlay,
                          color: Colors.white,
                          size: pHeight * 0.025,
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Container(
                          child: Center(
                              child: Text(
                            'Rate us on Play Store',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: pHeight * 0.025,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: pHeight * 0.02,
              ),
              InkWell(
                onTap: () {
                  _launchURL1();
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.scroll,
                          color: Colors.white,
                          size: pHeight * 0.025,
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Container(
                          child: Center(
                              child: Text(
                            'Information',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: pHeight * 0.025,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: pHeight * 0.02,
              ),
              InkWell(
                onTap: () {
                  _signOut(context);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                          size: pHeight * 0.025,
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Container(
                          child: Center(
                              child: Text(
                            'Log Out',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: pHeight * 0.025,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.axactstudios.solvecase';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL1() async {
    const url = 'https://dreamthyeve.blogspot.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    pushNewScreen(context, screen: MainPage(), withNavBar: false);
  }
}
