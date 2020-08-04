import 'package:flutter/material.dart';
import 'package:lumevents/classes/DatabaseHelper.dart';
import 'package:lumevents/classes/WishlistModel.dart';

import '../theme.dart' as Theme;

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  List<WishlistModel> wishlistItems = [];
  final dbHelper = DatabaseHelper.instance;

  void getAllItems() async {
    final allRows = await dbHelper.queryAllRows();
    wishlistItems.clear();
    allRows.forEach((row) => wishlistItems.add(WishlistModel.fromMap(row)));
    setState(() {});
  }

  void removeItem(String name) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.delete(name);
    getAllItems();
  }

  @override
  void initState() {
    getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Image.asset(
                'images/dreamthyeve.png',
                scale: 26,
              ),
              Spacer(),
              Text(
                'Wishlist',
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.MyColors.themeColor,
                    fontFamily: 'nunito'),
                textAlign: TextAlign.left,
              ),
              Spacer()
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                var item = wishlistItems[index];
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.MyColors.themeColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                    fontFamily: 'nunito',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              Text(
                                item.extras,
                                style: TextStyle(
                                    fontFamily: 'nunito',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              removeItem(item.name);
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
