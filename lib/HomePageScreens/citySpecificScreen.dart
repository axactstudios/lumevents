import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:getflutter/components/carousel/gf_carousel.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:lumevents/HomePageScreens/cityVendorScreen.dart';
import 'package:lumevents/classes/Trending.dart';
import 'package:lumevents/theme.dart' as Theme;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';

// ignore: must_be_immutable
class CitySpecificScreen extends StatefulWidget {
  String city;
  CitySpecificScreen(this.city);
  @override
  _CitySpecificScreenState createState() => _CitySpecificScreenState();
}

List<Trending> trends = [];

double height, width;
final List<String> imageList = [];
String pUrl =
    "https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Home%2FAll%20Cities%2FTrending%2FUnknown-3.png?alt=media&token=9b6c8c33-73ac-4cf4-9b6f-8a93d3b79d92";

class _CitySpecificScreenState extends State<CitySpecificScreen> {
  getDatabaseRef(List<Trending> trends) async {
    DatabaseReference dbref = FirebaseDatabase.instance
        .reference()
        .child("Home")
        .child(widget.city)
        .child("Trending");
    await dbref.once().then((DataSnapshot snap) {
      // ignore: non_constant_identifier_names
      var KEYS = snap.value.keys;
      // ignore: non_constant_identifier_names
      var DATA = snap.value;
      trends.clear();
      imageList.clear();
      for (var key in KEYS) {
        Trending d = new Trending(DATA[key]['Name'], DATA[key]['ImageUrl'],
            DATA[key]['Description'], DATA[key]['ImageBy']);
        trends.add(d);
        imageList.add(DATA[key]['ImageUrl']);
      }
      setState(() {
        print(trends.length);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDatabaseRef(trends);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Trending',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Theme.MyColors.themeColor,
                ),
              ),
            ),
            trends.length != 0
                ? GFCarousel(
                    items: imageList.map(
                      (url) {
                        return Container(
                          margin: EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Image.network(url,
                                fit: BoxFit.cover, width: 1000.0),
                          ),
                        );
                      },
                    ).toList(),
                    onPageChanged: (index) {
                      setState(() {
                        index;
                      });
                    },
                    autoPlay: true,
                    enlargeMainPage: true,
                    pagination: true,
                    passiveIndicator: Colors.black,
                    activeIndicator: Colors.white,
                    pagerSize: 10,
                  )
                : Center(
                    child: SpinKitWave(
                      size: 30,
                      color: Theme.MyColors.themeColor.withOpacity(0.7),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Vendors Available',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Theme.MyColors.themeColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory(
                  'Artists',
                  pUrl,
                  widget.city,
                  context,
                  width,
                ),
                _retCatrgory(
                  'Venues',
                  pUrl,
                  widget.city,
                  context,
                  width,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory('Planner', pUrl, widget.city, context, width),
                _retCatrgory('Photographer', pUrl, widget.city, context, width)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory(
                    'Music/\nDancer', pUrl, widget.city, context, width),
                _retCatrgory('Makeup', pUrl, widget.city, context, width),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory('Jewellery', pUrl, widget.city, context, width),
                _retCatrgory('Invites', pUrl, widget.city, context, width),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory('Groom Wear', pUrl, widget.city, context, width),
                _retCatrgory('Bridal Wear', pUrl, widget.city, context, width),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory('Decoration', pUrl, widget.city, context, width),
                _retCatrgory('Food', pUrl, widget.city, context, width),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory('Mehendi', pUrl, widget.city, context, width)
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

Widget _retCatrgory(
    String name, url, city, BuildContext context, double width) {
  return InkWell(
    onTap: () {
      pushNewScreen(
        context,
        screen: CityVendorScreen(city, name),
        platformSpecific:
            false, // OPTIONAL VALUE. False by default, which means the bottom nav bar will persist
        withNavBar: true, // OPTIONAL VALUE. True by default.
      );
    },
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 3.0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  0.0, // Move to bottom 10 Vertically
                ),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: (width / 2) - 12,
        width: (width / 2) - 18,
        child: GFImageOverlay(
          height: 200,
          width: 300,
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.3), BlendMode.darken),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: NetworkImage(url),
        ),
      ),
    ),
  );
}
