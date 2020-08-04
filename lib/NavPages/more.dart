import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lumevents/MainPage.dart';
import 'package:lumevents/NavPages/socialmediascreen.dart';
import 'package:lumevents/authentication/LoginPage.dart';
import 'package:lumevents/profilePage/ProfilePage.dart';
import 'package:lumevents/profilePage/ProfileSetup.dart';
import 'package:lumevents/profilePage/User.dart';
import 'package:mailer2/mailer.dart';
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

  TextEditingController numberController = new TextEditingController(text: '');
  TextEditingController eventController = new TextEditingController(text: '');
  TextEditingController budgetController = new TextEditingController(text: '');

  send() async {
    var options = new GmailSmtpOptions()
      ..username = 'axactstudios@gmail.com'
      ..password = 'dranzer_axactstudios';

    var emailTransport = new SmtpTransport(options);

    // Create our mail/envelope.
    var envelope = new Envelope()
      ..from = 'axactstudios@gmail.com'
      ..recipients.add(
        'lumevent@gmail.com',
      )
      ..subject = 'Callback Request ${DateTime.now()}'
      ..text =
          'Phone Number-${numberController.text}\nEvent-${eventController.text}\nBudget-${budgetController.text}';

    // Email it.
    emailTransport
        .send(envelope)
        .then((envelope) => print('Email sent!'))
        .catchError((e) => print('Error occurred: $e'));
  }

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
        title: Container(
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Image.asset(
                'images/dreamthyeve.png',
                scale: 26,
              ),
              Spacer(),
              Text(
                'More options',
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.MyColors.themeColor,
                    fontFamily: 'nunito'),
                textAlign: TextAlign.left,
              ),
              Spacer()
            ],
          ),
        ),
      ),
//      appBar: AppBar(
//        automaticallyImplyLeading: false,
//        backgroundColor: Colors.white,
//        actions: [
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 8.0),
//            child: Image.asset(
//              'images/dreamthyeve.png',
//              scale: 26,
//            ),
//          )
//        ],
//        title: Text(
//          'More Options',
//          overflow: TextOverflow.fade,
//          style: TextStyle(
//              fontSize: 24,
//              fontWeight: FontWeight.bold,
//              color: Theme.MyColors.themeColor,
//              fontFamily: 'nunito'),
//          textAlign: TextAlign.left,
//        ),
//      ),
//      appBar: AppBar(
//          automaticallyImplyLeading: false,
//          backgroundColor: Colors.white,
//          title: Row(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: [
//              Image.asset(
//                'images/dreamthyeve.png',
//                scale: 26,
//              ),
//            ],
//          ),
//          actions: [
//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: [
//                Container(
//                  width: pWidth * 0.55,
//                  child: Text(
//                    'More Options',
//                    overflow: TextOverflow.fade,
//                    style: TextStyle(
//                        fontSize: 22,
//                        fontWeight: FontWeight.bold,
//                        color: Theme.MyColors.themeColor,
//                        fontFamily: 'nunito'),
//                    textAlign: TextAlign.left,
//                  ),
//                ),
//              ],
//            ),
//          ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
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
                      color: Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/profile.png',
                              height: pHeight * 0.1,
                            ),
                            SizedBox(
                              height: pHeight * 0.02,
                            ),
                            Container(
                              width: pWidth * 0.35,
                              child: Center(
                                child: Text(
                                  'Profile',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.75),
                                      fontFamily: 'nunito',
                                      fontSize: pHeight * 0.025,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: pWidth * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      pushNewScreen(context,
                          screen: SocialMediaScreen(), withNavBar: true);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/contactus.png',
                              height: pHeight * 0.1,
                            ),
                            SizedBox(
                              height: pHeight * 0.02,
                            ),
                            Container(
                              width: pWidth * 0.35,
                              child: Center(
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.75),
                                      fontFamily: 'nunito',
                                      fontSize: pHeight * 0.025,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: pHeight * 0.03,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _launchURL();
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/rating.png',
                              height: pHeight * 0.1,
                            ),
                            SizedBox(
                              height: pHeight * 0.02,
                            ),
                            Container(
                              width: pWidth * 0.35,
                              child: Center(
                                  child: Text(
                                'Rate us',
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75),
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
                    width: pWidth * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL1();
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/information.png',
                              height: pHeight * 0.1,
                            ),
                            SizedBox(
                              height: pHeight * 0.02,
                            ),
                            Container(
                              width: pWidth * 0.35,
                              child: Center(
                                  child: Text(
                                'Information',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75),
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
                ],
              ),
              SizedBox(
                height: pHeight * 0.02,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        child: Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextFormField(
                                  controller: numberController,
                                  decoration: InputDecoration(
                                      hintText: 'Enter your phone number',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.black.withOpacity(0.75),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: eventController,
                                  decoration: InputDecoration(
                                      hintText: 'Enter your type of event',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.black.withOpacity(0.75),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: budgetController,
                                  decoration: InputDecoration(
                                      hintText: 'Enter your budget',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.black.withOpacity(0.75),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                                SizedBox(
                                  height: pHeight * 0.01,
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Theme.MyColors.themeColor,
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.white,
                                  onPressed: () {
                                    send();
                                  },
                                  child: Text(
                                    'Request Callback',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontFamily: 'nunito',
                                        fontSize: pHeight * 0.022,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/callback.png',
                              height: pHeight * 0.1,
                            ),
                            SizedBox(
                              height: pHeight * 0.02,
                            ),
                            Container(
                              width: pWidth * 0.35,
                              child: Center(
                                  child: Text(
                                'Request a Call',
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75),
                                    fontFamily: 'nunito',
                                    fontSize: pHeight * 0.022,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: pWidth * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      _signOut(context);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/signout.png',
                              height: pHeight * 0.1,
                            ),
                            SizedBox(
                              height: pHeight * 0.02,
                            ),
                            Container(
                              width: pWidth * 0.35,
                              child: Center(
                                  child: Text(
                                'Sign out',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75),
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
                ],
              ),
              SizedBox(
                height: pHeight * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.axactstudios.lumevents';
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
