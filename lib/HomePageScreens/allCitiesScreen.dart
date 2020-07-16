import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lumevents/classes/DatabaseHelper.dart';
import 'package:lumevents/classes/Trending.dart';
import 'package:lumevents/classes/Events.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme.dart' as Theme;
import 'DetailsPullUps/uiEvents.dart';
import 'DetailsPullUps/uiIdeas.dart';
import 'DetailsPullUps/uiTrends.dart';
import 'DetailsPullUps/uiVideos.dart';

class AllCitiesScreen extends StatefulWidget {
  @override
  _AllCitiesScreenState createState() => _AllCitiesScreenState();
}

final scaffoldState = GlobalKey<ScaffoldState>();
double width, height;
String str = 'Trending';
List<Trending> trends = [];
List<Trending> ideas = [];
List<Events> events = [];
List<Events> vids = [];

class _AllCitiesScreenState extends State<AllCitiesScreen> {
  getDatabaseRef(String type, List<Trending> arr) async {
    DatabaseReference dbref = FirebaseDatabase.instance
        .reference()
        .child("Home")
        .child("AllCities")
        .child(type);
    await dbref.once().then((DataSnapshot snap) {
      // ignore: non_constant_identifier_names
      var KEYS = snap.value.keys;
      // ignore: non_constant_identifier_names
      var DATA = snap.value;
      arr.clear();
      for (var key in KEYS) {
        Trending d = new Trending(DATA[key]['Name'], DATA[key]['ImageUrl'],
            DATA[key]['Description'], DATA[key]['ImageBy']);
        arr.add(d);
      }
      setState(() {
        print(arr.length);
      });
    });
  }

  getDatabaseRef1(String type, List<Events> arr) async {
    DatabaseReference dbref = FirebaseDatabase.instance
        .reference()
        .child("Home")
        .child("AllCities")
        .child(type);
    await dbref.once().then((DataSnapshot snap) {
      // ignore: non_constant_identifier_names
      var KEYS = snap.value.keys;
      // ignore: non_constant_identifier_names
      var DATA = snap.value;
      arr.clear();
      for (var key in KEYS) {
        Events d = new Events(DATA[key]['Name'], DATA[key]['ImageUrl'],
            DATA[key]['Description'], DATA[key]['City'], DATA[key]['Client']);
        arr.add(d);
      }
      setState(() {
        print(arr.length);
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getDatabaseRef("Trending", trends);
    getDatabaseRef("TopIdeas", ideas);
    getDatabaseRef1("Events", events);
    getDatabaseRef1("FeaturedVds", vids);
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      getDatabaseRef("Trending", trends);
      getDatabaseRef("TopIdeas", ideas);
    });

    return completer.future.then<void>((_) {});
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldState,
      body: LiquidPullToRefresh(
        color: Theme.MyColors.themeColor.withOpacity(0.5),
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
              child: Text(
                'Trending',
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.MyColors.themeColor,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 330,
              child: trends.length == 0
                  ? Center(
                      child: SpinKitWave(
                        size: 30,
                        color: Theme.MyColors.themeColor.withOpacity(0.7),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trends.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            scaffoldState.currentState
                                .showBottomSheet((context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter state) {
                                return UITrends(
                                    trends[index].name,
                                    trends[index].imageUrl,
                                    trends[index].description,
                                    trends[index].imageBy,
                                    context,
                                    height,
                                    width);
                              });
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 234,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 20.0, // soften the shadow
                                    spreadRadius: 3.0, //extend the shadow
                                    offset: Offset(
                                      10.0, // Move to right 10  horizontally
                                      20.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.fromLTRB(20, 10, 10, 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: 60,
                                  width: 310,
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(ideas[index].imageUrl),
                                        backgroundColor: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Presented By',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'nunito',
                                                fontSize: 18),
                                          ),
                                          Container(
                                            width: 240,
                                            color: Colors.white,
                                            child: Text(
                                              '${trends[index].imageBy}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'nunito',
                                                  fontSize: 18),
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 210,
                                  width: 310,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: GFImageOverlay(
                                      height: 200,
                                      width: 300,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              trends[index].description,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'nunito'),
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      colorFilter: new ColorFilter.mode(
                                          Colors.black.withOpacity(0.3),
                                          BlendMode.darken),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image:
                                          NetworkImage(trends[index].imageUrl),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
              child: Text(
                'Top Ideas',
                style: TextStyle(
                    color: Theme.MyColors.themeColor,
                    fontSize: 24,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 330,
              child: ideas.length == 0
                  ? Center(
                      child: SpinKitWave(
                        size: 30,
                        color: Theme.MyColors.themeColor.withOpacity(0.7),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ideas.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            scaffoldState.currentState
                                .showBottomSheet((context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter state) {
                                return UIIdeas(
                                    ideas[index].name,
                                    ideas[index].imageUrl,
                                    ideas[index].description,
                                    ideas[index].imageBy,
                                    context,
                                    height,
                                    width);
                              });
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 234,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 20.0, // soften the shadow
                                    spreadRadius: 3.0, //extend the shadow
                                    offset: Offset(
                                      10.0, // Move to right 10  horizontally
                                      20.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.fromLTRB(20, 10, 10, 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: 60,
                                  width: 310,
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(ideas[0].imageUrl),
                                        backgroundColor: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Presented By',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'nunito',
                                                fontSize: 18),
                                          ),
                                          Container(
                                            width: 240,
                                            child: Text(
                                              '${ideas[index].imageBy}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'nunito',
                                                  fontSize: 18),
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 210,
                                  width: 310,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: GFImageOverlay(
                                      height: 200,
                                      width: 300,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              ideas[index].description,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'nunito'),
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      colorFilter: new ColorFilter.mode(
                                          Colors.black.withOpacity(0.3),
                                          BlendMode.darken),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image:
                                          NetworkImage(ideas[index].imageUrl),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
              child: Text(
                'Events Powered By Us',
                style: TextStyle(
                    color: Theme.MyColors.themeColor,
                    fontSize: 24,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 330,
              child: events.length == 0
                  ? Center(
                      child: SpinKitWave(
                        size: 30,
                        color: Theme.MyColors.themeColor.withOpacity(0.7),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: events.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            scaffoldState.currentState
                                .showBottomSheet((context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter state) {
                                return UIEvents(
                                    events[index].name,
                                    events[index].imageUrl,
                                    events[index].description,
                                    events[index].client,
                                    events[index].city,
                                    context,
                                    height,
                                    width);
                              });
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 234,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 20.0, // soften the shadow
                                    spreadRadius: 3.0, //extend the shadow
                                    offset: Offset(
                                      10.0, // Move to right 10  horizontally
                                      20.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.fromLTRB(20, 10, 10, 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: 60,
                                  width: 310,
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            events[index].imageUrl),
                                        backgroundColor: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Presented By',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'nunito',
                                                fontSize: 18),
                                          ),
                                          Container(
                                            width: 240,
                                            child: Text(
                                              '${events[index].client}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'nunito',
                                                  fontSize: 18),
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 210,
                                  width: 310,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: GFImageOverlay(
                                      height: 200,
                                      width: 300,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              events[index].description,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'nunito'),
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      colorFilter: new ColorFilter.mode(
                                          Colors.black.withOpacity(0.3),
                                          BlendMode.darken),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image:
                                          NetworkImage(events[index].imageUrl),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
              child: Text(
                'Featured Videos',
                style: TextStyle(
                    color: Theme.MyColors.themeColor,
                    fontSize: 24,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 330,
              child: vids.length == 0
                  ? Center(
                      child: SpinKitWave(
                        size: 30,
                        color: Theme.MyColors.themeColor.withOpacity(0.7),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vids.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            scaffoldState.currentState
                                .showBottomSheet((context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter state) {
                                return UIVideos(
                                    vids[index].name,
                                    trends[index].imageUrl,
                                    vids[index].description,
                                    vids[index].client,
                                    vids[index].city,
                                    context,
                                    height,
                                    width);
                              });
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 234,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 20.0, // soften the shadow
                                    spreadRadius: 3.0, //extend the shadow
                                    offset: Offset(
                                      10.0, // Move to right 10  horizontally
                                      20.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.fromLTRB(20, 10, 10, 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: 60,
                                  width: 310,
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(ideas[0].imageUrl),
                                        backgroundColor: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Presented By',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'nunito',
                                                fontSize: 18),
                                          ),
                                          Container(
                                            width: 240,
                                            child: Text(
                                              '${vids[index].client}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'nunito',
                                                  fontSize: 18),
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 210,
                                  width: 310,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: GFImageOverlay(
                                      height: 200,
                                      width: 300,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              vids[index].description,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'nunito'),
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      colorFilter: new ColorFilter.mode(
                                          Colors.black.withOpacity(0.3),
                                          BlendMode.darken),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image:
                                          NetworkImage(events[index].imageUrl),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ]),
        ),
      ),
    );
  }
}
