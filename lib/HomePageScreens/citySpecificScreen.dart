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
String artistUrl =
    "https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Fartist%201.jpg?alt=media&token=894b28c3-882b-4e5a-8bd6-8cbff8af14d2";
String bridalUrl =
    "https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Fbridal%20wear%201.jpg?alt=media&token=978d67d8-2403-45bd-baed-9d0f01137c70";
String decoUrl =
    "https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Fdecoration%202.jpg?alt=media&token=bac9a7e9-c4af-4a9e-bb46-b284a7e560d2";

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
    print(widget.city);
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
                  artistUrl,
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
                _retCatrgory(
                    'Planner',
                    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Fvenue%203.jpg?alt=media&token=0f54f124-8f33-44a7-9ca5-f34162be2404',
                    widget.city,
                    context,
                    width),
                _retCatrgory(
                    'Photographer',
                    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Fphotographer%201.jpg?alt=media&token=0c94d298-f887-493d-8dba-19d38af80451',
                    widget.city,
                    context,
                    width)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory(
                    'Music/\nDancer',
                    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Fdancer%201.jpg?alt=media&token=461f87ad-6bd6-406c-a8d8-d05ca8cdaf69',
                    widget.city,
                    context,
                    width),
                _retCatrgory(
                    'Makeup',
                    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Fmakeup%203.jpg?alt=media&token=7edac78c-36c0-40a3-8216-d81300f5ea59',
                    widget.city,
                    context,
                    width),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory(
                    'Jewellery',
                    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Fjewellery%201.jpg?alt=media&token=d55e6866-fdaf-44eb-a83f-032a5ef2d483',
                    widget.city,
                    context,
                    width),
                _retCatrgory(
                    'Invites',
                    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Finvites%201.jpg?alt=media&token=4ad5863b-54b9-4b6e-b590-e77c5e235dc5',
                    widget.city,
                    context,
                    width),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory(
                    'Groom Wear',
                    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Fgroom%20wear%201.jpg?alt=media&token=ec4bd131-f325-4487-b44f-565cf37616a6',
                    widget.city,
                    context,
                    width),
                _retCatrgory(
                    'Bridal Wear', bridalUrl, widget.city, context, width),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory(
                    'Decoration', decoUrl, widget.city, context, width),
                _retCatrgory(
                    'Food',
                    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Ffood%201.jpg?alt=media&token=abc285e4-ce1a-4bf9-9b90-d0b852a6249d',
                    widget.city,
                    context,
                    width),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _retCatrgory(
                    'Mehendi',
                    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/CitySpecific%20Screen%20Images%2Fmehendi%202.jpg?alt=media&token=98e509c5-787e-4cb9-94b4-c8c6e97babb7',
                    widget.city,
                    context,
                    width)
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
