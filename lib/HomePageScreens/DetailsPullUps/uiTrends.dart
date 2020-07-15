import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lumevents/HomePageScreens/DetailsPullUps/getVendors.dart';
import 'package:lumevents/classes/DatabaseHelper.dart';
import 'package:lumevents/classes/WishlistModel.dart';

import '../../theme.dart' as Theme;

final dbHelper = DatabaseHelper.instance;

void addToWishlist({String name, String extras}) async {
  Map<String, dynamic> row = {
    DatabaseHelper.columnName: name,
    DatabaseHelper.columnExtras: extras,
  };
  WishlistModel item = WishlistModel.fromMap(row);
  final id = await dbHelper.insert(item);
  Fluttertoast.showToast(
      msg: 'Added to wishlist', toastLength: Toast.LENGTH_SHORT);
}

Widget UITrends(String name, imageUrl, description, imageBy,
    BuildContext context, double height, width) {
  return Container(
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 30.0, // soften the shadow
            spreadRadius: 3.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              0.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
    padding: EdgeInsets.all(15),
    height: height,
    width: width,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Theme.MyColors.themeColor,
                    fontFamily: 'nunito',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Image.network(
                          imageUrl,
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Presented by',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'nunito',
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      imageBy,
                      style: TextStyle(
                          color: Theme.MyColors.themeColor,
                          fontFamily: 'nunito',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Description-',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'nunito',
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                          color: Color(0xFF808080),
                          fontFamily: 'nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        addToWishlist(name: imageBy, extras: 'All cities');
                      },
                      child: Card(
                        color: Theme.MyColors.themeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Add to wishlist',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlannerScreen()),
                        );
                      },
                      child: Card(
                        color: Theme.MyColors.themeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "View Potential Vendors",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
