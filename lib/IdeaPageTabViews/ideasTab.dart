import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

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

  var currentPage = 4 - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 4 - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      key: scaffoldState,
      body: LiquidPullToRefresh(
        color: Colors.pink.withOpacity(0.5),
        onRefresh: _handleRefresh,
//        child: SingleChildScrollView(
//          physics: AlwaysScrollableScrollPhysics(),
//          child:
//              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
//                  Widget>[
//            Padding(
//              padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
//              child: Text(
//                'Trending',
//                style: TextStyle(
//                    fontSize: 24,
//                    fontFamily: 'nunito',
//                    fontWeight: FontWeight.bold),
//              ),
//            ),
//            Container(
//              height: 270,
//              child: ListView.builder(
//                scrollDirection: Axis.horizontal,
//                itemCount: 5,
//                itemBuilder: (BuildContext context, int index) {
//                  return InkWell(
//                    splashColor: Colors.transparent,
//                    highlightColor: Colors.transparent,
//                    onTap: () {
//                      scaffoldState.currentState.showBottomSheet((context) {
//                        return StatefulBuilder(
//                            builder: (BuildContext context, StateSetter state) {
//                          return Container();
//                        });
//                      });
//                    },
//                    child: Container(
//                      padding: EdgeInsets.all(2),
//                      height: 204,
//                      decoration: BoxDecoration(
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black26,
//                              blurRadius: 20.0, // soften the shadow
//                              spreadRadius: 3.0, //extend the shadow
//                              offset: Offset(
//                                10.0, // Move to right 10  horizontally
//                                20.0, // Move to bottom 10 Vertically
//                              ),
//                            )
//                          ],
//                          color: Colors.white,
//                          borderRadius: BorderRadius.all(Radius.circular(10))),
//                      margin: EdgeInsets.fromLTRB(20, 10, 10, 40),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Container(
//                            padding: EdgeInsets.all(5),
//                            height: 60,
//                            width: 250,
//                            child: Row(
//                              children: <Widget>[
//                                CircleAvatar(
//                                  backgroundColor: Colors.white,
//                                ),
//                                SizedBox(
//                                  width: 10,
//                                ),
//                                Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text(
//                                      'Presented By',
//                                      style: TextStyle(
//                                          color: Colors.black,
//                                          fontFamily: 'nunito',
//                                          fontSize: 18),
//                                    ),
//                                    Container(
//                                      width: 180,
//                                      child: Text(
//                                        'Image By',
//                                        style: TextStyle(
//                                            color: Colors.black,
//                                            fontWeight: FontWeight.bold,
//                                            fontFamily: 'nunito',
//                                            fontSize: 18),
//                                        overflow: TextOverflow.fade,
//                                        softWrap: false,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ],
//                            ),
//                          ),
//                          Container(
//                            height: 150,
//                            width: 250,
//                            child: ClipRRect(
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(10)),
//                              child: Image.network(
//                                "https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Home%2FAll%20Cities%2FTop%20Ideas%2Fdoug-maloney-B63UmuDkznY-unsplash.jpg?alt=media&token=9fb7580c-4332-423f-9193-3b05daa1b63d",
//                                fit: BoxFit.fill,
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  );
//                },
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
//              child: Text(
//                'Top Ideas',
//                style: TextStyle(
//                    fontSize: 24,
//                    fontFamily: 'nunito',
//                    fontWeight: FontWeight.bold),
//              ),
//            ),
//            Container(
//              height: 270,
//              child: ListView.builder(
//                scrollDirection: Axis.horizontal,
//                itemCount: 5,
//                itemBuilder: (BuildContext context, int index) {
//                  return InkWell(
//                    splashColor: Colors.transparent,
//                    highlightColor: Colors.transparent,
//                    onTap: () {
//                      scaffoldState.currentState.showBottomSheet((context) {
//                        return StatefulBuilder(
//                            builder: (BuildContext context, StateSetter state) {
//                          return Container();
//                        });
//                      });
//                    },
//                    child: Container(
//                      padding: EdgeInsets.all(2),
//                      height: 204,
//                      decoration: BoxDecoration(
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black26,
//                              blurRadius: 20.0, // soften the shadow
//                              spreadRadius: 3.0, //extend the shadow
//                              offset: Offset(
//                                10.0, // Move to right 10  horizontally
//                                20.0, // Move to bottom 10 Vertically
//                              ),
//                            )
//                          ],
//                          color: Colors.white,
//                          borderRadius: BorderRadius.all(Radius.circular(10))),
//                      margin: EdgeInsets.fromLTRB(20, 10, 10, 40),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Container(
//                            padding: EdgeInsets.all(5),
//                            height: 60,
//                            width: 250,
//                            child: Row(
//                              children: <Widget>[
//                                CircleAvatar(
//                                  backgroundColor: Colors.white,
//                                ),
//                                SizedBox(
//                                  width: 10,
//                                ),
//                                Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text(
//                                      'Presented By',
//                                      style: TextStyle(
//                                          color: Colors.black,
//                                          fontFamily: 'nunito',
//                                          fontSize: 18),
//                                    ),
//                                    Container(
//                                      width: 180,
//                                      child: Text(
//                                        'Image By',
//                                        style: TextStyle(
//                                            color: Colors.black,
//                                            fontWeight: FontWeight.bold,
//                                            fontFamily: 'nunito',
//                                            fontSize: 18),
//                                        overflow: TextOverflow.fade,
//                                        softWrap: false,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ],
//                            ),
//                          ),
//                          Container(
//                            height: 150,
//                            width: 250,
//                            child: ClipRRect(
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(10)),
//                              child: Image.network(
//                                "https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Home%2FAll%20Cities%2FTop%20Ideas%2Fdoug-maloney-B63UmuDkznY-unsplash.jpg?alt=media&token=9fb7580c-4332-423f-9193-3b05daa1b63d",
//                                fit: BoxFit.fill,
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  );
//                },
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
//              child: Text(
//                'Events Powered By Us',
//                style: TextStyle(
//                    fontSize: 24,
//                    fontFamily: 'nunito',
//                    fontWeight: FontWeight.bold),
//              ),
//            ),
//            Container(
//              height: 270,
//              child: ListView.builder(
//                scrollDirection: Axis.horizontal,
//                itemCount: 5,
//                itemBuilder: (BuildContext context, int index) {
//                  return InkWell(
//                    splashColor: Colors.transparent,
//                    highlightColor: Colors.transparent,
//                    onTap: () {
//                      scaffoldState.currentState.showBottomSheet((context) {
//                        return StatefulBuilder(
//                            builder: (BuildContext context, StateSetter state) {
//                          return Container();
//                        });
//                      });
//                    },
//                    child: Container(
//                      padding: EdgeInsets.all(2),
//                      height: 204,
//                      decoration: BoxDecoration(
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black26,
//                              blurRadius: 20.0, // soften the shadow
//                              spreadRadius: 3.0, //extend the shadow
//                              offset: Offset(
//                                10.0, // Move to right 10  horizontally
//                                20.0, // Move to bottom 10 Vertically
//                              ),
//                            )
//                          ],
//                          color: Colors.white,
//                          borderRadius: BorderRadius.all(Radius.circular(10))),
//                      margin: EdgeInsets.fromLTRB(20, 10, 10, 40),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Container(
//                            padding: EdgeInsets.all(5),
//                            height: 60,
//                            width: 250,
//                            child: Row(
//                              children: <Widget>[
//                                CircleAvatar(
//                                  backgroundColor: Colors.white,
//                                ),
//                                SizedBox(
//                                  width: 10,
//                                ),
//                                Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text(
//                                      'Presented By',
//                                      style: TextStyle(
//                                          color: Colors.black,
//                                          fontFamily: 'nunito',
//                                          fontSize: 18),
//                                    ),
//                                    Container(
//                                      width: 180,
//                                      child: Text(
//                                        'Image By',
//                                        style: TextStyle(
//                                            color: Colors.black,
//                                            fontWeight: FontWeight.bold,
//                                            fontFamily: 'nunito',
//                                            fontSize: 18),
//                                        overflow: TextOverflow.fade,
//                                        softWrap: false,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ],
//                            ),
//                          ),
//                          Container(
//                            height: 150,
//                            width: 250,
//                            child: ClipRRect(
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(10)),
//                              child: Image.network(
//                                "https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Home%2FAll%20Cities%2FTop%20Ideas%2Fdoug-maloney-B63UmuDkznY-unsplash.jpg?alt=media&token=9fb7580c-4332-423f-9193-3b05daa1b63d",
//                                fit: BoxFit.fill,
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  );
//                },
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 0),
//              child: Text(
//                'Featured Videos',
//                style: TextStyle(
//                    fontSize: 24,
//                    fontFamily: 'nunito',
//                    fontWeight: FontWeight.bold),
//              ),
//            ),
//            Container(
//              height: 270,
//              child: ListView.builder(
//                scrollDirection: Axis.horizontal,
//                itemCount: 5,
//                itemBuilder: (BuildContext context, int index) {
//                  return InkWell(
//                    splashColor: Colors.transparent,
//                    highlightColor: Colors.transparent,
//                    onTap: () {
//                      scaffoldState.currentState.showBottomSheet((context) {
//                        return StatefulBuilder(
//                            builder: (BuildContext context, StateSetter state) {
//                          return Container();
//                        });
//                      });
//                    },
//                    child: Container(
//                      padding: EdgeInsets.all(2),
//                      height: 204,
//                      decoration: BoxDecoration(
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black26,
//                              blurRadius: 20.0, // soften the shadow
//                              spreadRadius: 3.0, //extend the shadow
//                              offset: Offset(
//                                10.0, // Move to right 10  horizontally
//                                20.0, // Move to bottom 10 Vertically
//                              ),
//                            )
//                          ],
//                          color: Colors.white,
//                          borderRadius: BorderRadius.all(Radius.circular(10))),
//                      margin: EdgeInsets.fromLTRB(20, 10, 10, 40),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Container(
//                            padding: EdgeInsets.all(5),
//                            height: 60,
//                            width: 250,
//                            child: Row(
//                              children: <Widget>[
//                                CircleAvatar(
//                                  backgroundColor: Colors.white,
//                                ),
//                                SizedBox(
//                                  width: 10,
//                                ),
//                                Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text(
//                                      'Presented By',
//                                      style: TextStyle(
//                                          color: Colors.black,
//                                          fontFamily: 'nunito',
//                                          fontSize: 18),
//                                    ),
//                                    Container(
//                                      width: 180,
//                                      child: Text(
//                                        'Image By',
//                                        style: TextStyle(
//                                            color: Colors.black,
//                                            fontWeight: FontWeight.bold,
//                                            fontFamily: 'nunito',
//                                            fontSize: 18),
//                                        overflow: TextOverflow.fade,
//                                        softWrap: false,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ],
//                            ),
//                          ),
//                          Container(
//                            height: 150,
//                            width: 250,
//                            child: ClipRRect(
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(10)),
//                              child: Image.network(
//                                "https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Home%2FAll%20Cities%2FTop%20Ideas%2Fdoug-maloney-B63UmuDkznY-unsplash.jpg?alt=media&token=9fb7580c-4332-423f-9193-3b05daa1b63d",
//                                fit: BoxFit.fill,
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  );
//                },
//              ),
//            ),
//          ]),
//        ),

        child: Container(
          color: Colors.teal,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Trending",
                      style: TextStyle(
                        color: Colors.black,
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
                        itemCount: 4,
                        controller: controller,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container();
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
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("assets/image_02.jpg",
                            width: 296.0, height: 222.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

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
          var delta = i - currentPage;
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
                      Image.asset('hysgudfsyu', fit: BoxFit.cover),
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
