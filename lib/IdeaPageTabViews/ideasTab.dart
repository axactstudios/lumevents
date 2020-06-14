import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lumevents/HomePageScreens/DetailsPullUps/uiTrends.dart';
import 'package:lumevents/classes/Trending.dart';

class IdeasTab extends StatefulWidget {
  @override
  _IdeasTabState createState() => _IdeasTabState();
}

final scaffoldState = GlobalKey<ScaffoldState>();

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _IdeasTabState extends State<IdeasTab> {
  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {});

    return completer.future.then<void>((_) {});
  }

  List<Trending> bday = [];
  List<Trending> wed = [];
  List<Trending> corp = [];
  List<Trending> private = [];
  List<Trending> other = [];

  var currentPage = 4 - 1.0;
  var currentPage1 = 4 - 1.0;
  getDatabaseRef(String type, List<Trending> arr) async {
    DatabaseReference dbref = FirebaseDatabase.instance
        .reference()
        .child("Ideas")
        .child("Ideas")
        .child(type)
        .child("Images");
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

  @override
  void initState() {
    super.initState();
    getDatabaseRef("Birthdays", bday);
  }

  double height, width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    PageController controller = new PageController(initialPage: 4 - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    PageController controller1 = new PageController(initialPage: 4 - 1);
    controller.addListener(() {
      setState(() {
        currentPage1 = controller.page;
      });
    });

    return Scaffold(
      key: scaffoldState,
      body: LiquidPullToRefresh(
        color: Colors.pink.withOpacity(0.5),
        onRefresh: _handleRefresh,
        child: Container(
          color: Color(0xFFFF4B8F),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Trending",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      )),
                ),
                Stack(
                  children: <Widget>[
                    CardScrollWidget(currentPage),
                    Positioned.fill(
                      child: PageView.builder(
                        itemCount: bday.length,
                        controller: controller,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                scaffoldState.currentState
                                    .showBottomSheet((context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter state) {
                                    return UITrends(
                                        bday[index].name,
                                        bday[index].imageUrl,
                                        bday[index].description,
                                        bday[index].imageBy,
                                        context,
                                        height,
                                        width);
                                  });
                                });
                              },
                              child: Container());
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Favourite",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 46.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 22.0, vertical: 6.0),
                            child: Text("Latest",
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text("9+ Stories",
                          style: TextStyle(color: Colors.blueAccent))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Stack(
                  children: <Widget>[
                    CardScrollWidget(currentPage1),
                    Positioned.fill(
                      child: PageView.builder(
                        itemCount: 4,
                        controller: controller1,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container();
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatefulWidget {
  var currentPage;
  CardScrollWidget(this.currentPage);

  @override
  _CardScrollWidgetState createState() => _CardScrollWidgetState();
}

class _CardScrollWidgetState extends State<CardScrollWidget> {
  var padding = 20.0;

  var verticalInset = 20.0;

  List<Trending> bday = [];

  List<Trending> wed = [];

  List<Trending> corp = [];

  List<Trending> private = [];

  List<Trending> other = [];

  getDatabaseRef(String type, List<Trending> arr) async {
    DatabaseReference dbref = FirebaseDatabase.instance
        .reference()
        .child("Ideas")
        .child("Ideas")
        .child(type)
        .child("Images");
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

  @override
  void initState() {
    super.initState();
    getDatabaseRef("Birthdays", bday);
  }

  var currentPage = 4 - 1.0;

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < 4; i++) {
          var delta = i - widget.currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Positioned.fill(
                        child: PageView.builder(
                          itemCount: bday.length,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Image.network(
                                bday[index].imageUrl,
                                fit: BoxFit.values[1],
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text('Title',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text("Read Later",
                                    style: TextStyle(color: Colors.black)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
