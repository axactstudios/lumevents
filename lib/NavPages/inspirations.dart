import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../theme.dart' as Theme;
import 'InspirationsPages/CorporateEventsPage.dart';
import 'InspirationsPages/OthersPage.dart';
import 'InspirationsPages/SpecialEventsPage.dart';
import 'InspirationsPages/WeddingsPage.dart';
import 'InspirationsPages/birthdayPage.dart';

class RealEventsTab extends StatefulWidget {
  @override
  _RealEventsTabState createState() => _RealEventsTabState();
}

class _RealEventsTabState extends State<RealEventsTab> {
  double height, width;
  final scaffoldState = GlobalKey<ScaffoldState>();
  List<String> listOfUrls = [];
  getImages() {
    DatabaseReference ref =
        FirebaseDatabase.instance.reference().child('Ideas').child('Images');
    ref.orderByKey().once().then((DataSnapshot snap) {
      // ignore: non_constant_identifier_names
      var KEYS = snap.value.keys;
      // ignore: non_constant_identifier_names
      var DATA = snap.value;
      listOfUrls.clear();
      for (var key in KEYS) {
        listOfUrls.add(DATA[key]);
      }
      setState(() {
        print(listOfUrls.length);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(
              'images/dreamthyeve.png',
              scale: 26,
            ),
          )
        ],
        title: Text(
          'Dream It',
          overflow: TextOverflow.fade,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.MyColors.themeColor,
              fontFamily: 'nunito'),
          textAlign: TextAlign.left,
        ),
      ),
      key: scaffoldState,
      body: listOfUrls.length != 0
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Weddings(),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          elevation: 8,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    listOfUrls[0],
                                    height: height * 0.15,
                                    width: width * 0.4,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  'Weddings',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.75),
                                      fontFamily: 'nunito',
                                      fontSize: height * 0.018,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Birthdays()),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 8,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    listOfUrls[1],
                                    height: height * 0.15,
                                    width: width * 0.4,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  'Birthdays',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.75),
                                      fontFamily: 'nunito',
                                      fontSize: height * 0.018,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CorporateEvents()),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 8,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    listOfUrls[3],
                                    height: height * 0.15,
                                    width: width * 0.4,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  'Corporate Events',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.75),
                                      fontFamily: 'nunito',
                                      fontSize: height * 0.018,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SpecialEvents()),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 8,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    listOfUrls[5],
                                    height: height * 0.15,
                                    width: width * 0.4,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  'Special Events',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.75),
                                      fontFamily: 'nunito',
                                      fontSize: height * 0.018,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Others()),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 8,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    listOfUrls[4],
                                    height: height * 0.15,
                                    width: width * 0.4,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  'Others',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.75),
                                      fontFamily: 'nunito',
                                      fontSize: height * 0.018,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: 'Coming Soon', gravity: ToastGravity.CENTER);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 8,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    listOfUrls[2],
                                    height: height * 0.15,
                                    width: width * 0.4,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  'Artists',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.75),
                                      fontFamily: 'nunito',
                                      fontSize: height * 0.018,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : SpinKitWave(
              size: 30,
              color: Theme.MyColors.themeColor.withOpacity(0.7),
            ),
    );
  }
}
