import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'images/dreamthyeve.png',
                  scale: 26,
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 170,
                    child: Text(
                      'Inspirations',
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.MyColors.themeColor,
                          fontFamily: 'nunito'),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ]),
        key: scaffoldState,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Weddings()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/wedding.png',
                          scale: 7,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 50,
                          child: Center(
                              child: Text(
                            'Weddings',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Birthdays()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/gift-2.png',
                          scale: 7,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 50,
                          child: Center(
                              child: Text(
                            'Birthday Parties',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CorporateEvents()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/teamwork.png',
                          scale: 7,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 50,
                          child: Center(
                              child: Text(
                            'Corporate Events',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SpecialEvents()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/confetti.png',
                          scale: 7,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 50,
                          child: Center(
                              child: Text(
                            'Special Events',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Others()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/drink.png',
                          scale: 7,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 50,
                          child: Center(
                              child: Text(
                            'Others',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: 20,
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
        ));
  }
}
