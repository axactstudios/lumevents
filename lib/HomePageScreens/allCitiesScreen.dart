import 'dart:async';
import 'package:dropdown_banner/dropdown_banner.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lumevents/classes/Trending.dart';
import 'package:lumevents/classes/Events.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllCitiesScreen extends StatefulWidget {
  @override
  _AllCitiesScreenState createState() => _AllCitiesScreenState();
}

final scaffoldState = GlobalKey<ScaffoldState>();

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
    return Scaffold(
      key: scaffoldState,
      body: LiquidPullToRefresh(
        color: Colors.pink.withOpacity(0.5),
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
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 244,
              child: trends.length == 0
                  ? Center(
                      child: SpinKitWave(
                        size: 30,
                        color: Colors.pinkAccent.withOpacity(0.7),
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
                                    trends[index].imageBy);
                              });
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 204,
                            decoration: BoxDecoration(
                                color: Color(0xFFFF4B8F),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      trends[index].imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Image By',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'nunito',
                                      fontSize: 18),
                                ),
                                Text(
                                  '${trends[index].imageBy}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'nunito',
                                      fontSize: 18),
                                ),
                                Spacer(),
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
                    fontSize: 24,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 244,
              child: trends.length == 0
                  ? Center(
                      child: SpinKitWave(
                        size: 30,
                        color: Colors.pinkAccent.withOpacity(0.7),
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
                                    ideas[index].imageBy);
                              });
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 204,
                            decoration: BoxDecoration(
                                color: Color(0xFFFF4B8F),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      ideas[index].imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Image By',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'nunito',
                                      fontSize: 18),
                                ),
                                Text(
                                  '${trends[index].imageBy}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'nunito',
                                      fontSize: 18),
                                ),
                                Spacer(),
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
                    fontSize: 24,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 244,
              child: trends.length == 0
                  ? Center(
                      child: SpinKitWave(
                        size: 30,
                        color: Colors.pinkAccent.withOpacity(0.7),
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
                                    events[index].city);
                              });
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 204,
                            decoration: BoxDecoration(
                                color: Color(0xFFFF4B8F),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      events[index].imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Image By',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'nunito',
                                      fontSize: 18),
                                ),
                                Text(
                                  '${events[index].name}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'nunito',
                                      fontSize: 18),
                                ),
                                Spacer(),
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
                    fontSize: 24,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 244,
              child: trends.length == 0
                  ? Center(
                      child: SpinKitWave(
                        size: 30,
                        color: Colors.pinkAccent.withOpacity(0.7),
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
                                    //TODO:Change trends to vids
                                    trends[index].imageUrl,
                                    vids[index].description,
                                    vids[index].client,
                                    vids[index].city);
                              });
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 204,
                            decoration: BoxDecoration(
                                color: Color(0xFFFF4B8F),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      //TODO:Change trends to vids
                                      trends[index].imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Image By',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'nunito',
                                      fontSize: 18),
                                ),
                                Text(
                                  '${vids[index].name}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'nunito',
                                      fontSize: 18),
                                ),
                                Spacer(),
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

  Widget UITrends(String name, imageUrl, description, imageBy) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Image.network(
                  imageUrl,
                  alignment: Alignment.centerRight,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Image by',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.right,
                ),
                Text(
                  imageBy,
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: null,
                  child: Card(
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "View Vendor",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: null,
                  child: Card(
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Want the same for your wedding?\nGet in Touch Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget UIIdeas(String name, imageUrl, description, imageBy) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Image.network(
                  imageUrl,
                  alignment: Alignment.centerRight,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Image by',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.right,
                ),
                Text(
                  imageBy,
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    DropdownBanner.showBanner(
                      text: 'Go to $imageBy',
                      color: Colors.red,
                      textStyle: TextStyle(color: Colors.white),
                    );
                  },
                  child: Card(
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "View Vendor",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: null,
                  child: Card(
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Want the same for your wedding?\nGet in Touch Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget UIEvents(String name, imageUrl, description, client, city) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Image.network(
                  imageUrl,
                  alignment: Alignment.centerRight,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Client Name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.right,
                ),
                Text(
                  client,
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'City',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.right,
                ),
                Text(
                  city,
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: null,
                  child: Card(
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "View Top Vendors for\n"
                        "same designs",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: null,
                  child: Card(
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Want the same for your wedding?\nGet in Touch Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget UIVideos(String name, imageUrl, description, client, city) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Image.network(
                  imageUrl,
                  alignment: Alignment.centerRight,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Client Name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.right,
                ),
                Text(
                  client,
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'City',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.right,
                ),
                Text(
                  city,
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: null,
                  child: Card(
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "View Top Vendors for\n"
                        "same designs",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: null,
                  child: Card(
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Want the same for your wedding?\nGet in Touch Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
