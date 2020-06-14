import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lumevents/classes/Vendor.dart';

class CityVendorScreen extends StatefulWidget {
  String city, vendorType;
  CityVendorScreen(this.city, this.vendorType);

  @override
  _CityVendorScreenState createState() => _CityVendorScreenState();
}

final scaffoldState = GlobalKey<ScaffoldState>();

List databaseIdentifiers = [
  "Venues",
  "Mehndi",
  "Planner",
  "Photographer",
  "MusicDance",
  "MakeUp",
  "Jewellery",
  "Invites",
  "GroomWear",
  "BridalWear",
  "Decoration",
  "Foods"
];
String _currentCategory = "";
List<Vendor> availableVendors = [];
void setIdentifier(String check) {
  print('To check $check');
  if (check == "Venues") {
    _currentCategory = databaseIdentifiers[0];
  } else if (check == "Mehendi") {
    _currentCategory = databaseIdentifiers[1];
  } else if (check == "Planner") {
    _currentCategory = databaseIdentifiers[2];
  } else if (check == "Photographer") {
    _currentCategory = databaseIdentifiers[3];
  } else if (check == "Music/Dance") {
    _currentCategory = databaseIdentifiers[4];
  } else if (check == "Makeup") {
    _currentCategory = databaseIdentifiers[5];
  } else if (check == "Jewellery") {
    _currentCategory = databaseIdentifiers[6];
  } else if (check == "Invites") {
    _currentCategory = databaseIdentifiers[7];
  } else if (check == "Groom Wear") {
    _currentCategory = databaseIdentifiers[8];
  } else if (check == "Bridal Wear") {
    _currentCategory = databaseIdentifiers[9];
  } else if (check == "Decoration") {
    _currentCategory = databaseIdentifiers[10];
  } else if (check == "Food") {
    _currentCategory = databaseIdentifiers[11];
  }
}

double height, width;

class _CityVendorScreenState extends State<CityVendorScreen> {
  getDatabaseRef(List<Vendor> availableVendors) async {
    DatabaseReference dbref = FirebaseDatabase.instance
        .reference()
        .child("Home")
        .child(widget.city)
        .child(_currentCategory);
    await dbref.once().then((DataSnapshot snap) {
      // ignore: non_constant_identifier_names
      var KEYS = snap.value.keys;
      // ignore: non_constant_identifier_names
      var DATA = snap.value;
      availableVendors.clear();
      for (var key in KEYS) {
        Vendor d = new Vendor(
          DATA[key]["Brand"],
          DATA[key]['City'],
          DATA[key]['Description'],
          DATA[key]['ImageUrl'],
          DATA[key]['Name'],
          DATA[key]['NoOfClientsTillDate'],
          DATA[key]['PriceRange'],
          DATA[key]['Speciality'],
        );
        availableVendors.add(d);
        print('Vendor Details${d.city}');
      }
      setState(() {
        print(availableVendors.length);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDatabaseRef(availableVendors);
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      getDatabaseRef(availableVendors);
    });

    return completer.future.then<void>((_) {});
  }

  @override
  Widget build(BuildContext context) {
    getDatabaseRef(availableVendors);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    setIdentifier(widget.vendorType);
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: LiquidPullToRefresh(
        color: Colors.pink.withOpacity(0.5),
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Vendors Available',
                style: TextStyle(fontSize: 24),
              ),
              Container(
                height: height - 200,
                width: width,
                child: availableVendors.length == 0
                    ? Center(
                        child: SpinKitWave(
                          size: 30,
                          color: Colors.pinkAccent.withOpacity(0.7),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: availableVendors.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
//                            scaffoldState.currentState
//                                .showBottomSheet((context) {
//                              return StatefulBuilder(builder:
//                                  (BuildContext context, StateSetter state) {
//                                return UITrends(
//                                    trends[index].name,
//                                    trends[index].imageUrl,
//                                    trends[index].description,
//                                    trends[index].imageBy,
//                                    context,
//                                    height,
//                                    width);
//                              });
//                            });
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              height: 274,
                              width: 242,
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
                              margin: EdgeInsets.fromLTRB(50, 10, 50, 40),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    height: 60,
                                    width: 310,
                                    child: Row(
                                      children: <Widget>[
                                        availableVendors[index].imageurl != null
                                            ? CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    availableVendors[index]
                                                        .imageurl),
                                                backgroundColor: Colors.white,
                                              )
                                            : CircularProgressIndicator(),
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
                                                '${availableVendors[index].brand}',
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
                                      child: availableVendors[index].imageurl !=
                                              null
                                          ? GFImageOverlay(
                                              height: 200,
                                              width: 300,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      availableVendors[index]
                                                          .description,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'nunito'),
                                                      overflow:
                                                          TextOverflow.fade,
                                                      softWrap: false,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              colorFilter: new ColorFilter.mode(
                                                  Colors.black.withOpacity(0.3),
                                                  BlendMode.darken),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              image: NetworkImage(
                                                  availableVendors[index]
                                                      .imageurl))
                                          : Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
