import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lumevents/authentication/LoginPage.dart';
import 'package:lumevents/profilePage/ProfilePage.dart';
import 'package:lumevents/profilePage/ProfileSetup.dart';
import 'package:lumevents/profilePage/User.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
    return Container(
      color: Theme.MyColors.themeColor.withOpacity(0.7),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Card(
                color: Colors.white,
                elevation: 20.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: InkWell(
                      splashColor: Colors.blueGrey,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: Theme.MyColors.themeColor.withOpacity(0.7),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 30.0,
                                color:
                                    Theme.MyColors.themeColor.withOpacity(0.7),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
