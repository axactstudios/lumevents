import 'package:flutter/material.dart';
import 'package:lumevents/classes/DatabaseHelper.dart';
import 'package:lumevents/classes/WishlistModel.dart';

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
        title: Text(
          'MY WISHLIST',
          style: TextStyle(
              fontFamily: 'nunito',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 5),
        ),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.pinkAccent.shade100,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: wishlistItems.length,
                    itemBuilder: (context, index) {
                      var item = wishlistItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  item.name,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
