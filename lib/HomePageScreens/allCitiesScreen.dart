import 'dart:async';

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class AllCitiesScreen extends StatefulWidget {
  @override
  _AllCitiesScreenState createState() => _AllCitiesScreenState();
}

String str = 'Trending';
var _items = ['Hello', 'd', 'f', 'h', 's', 'e', 'e', 't', 'u', 'o'];

class _AllCitiesScreenState extends State<AllCitiesScreen> {
  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      if (_items[0] == 'Hello') {
        _items[0] = 'uipo';
      } else {
        _items[0] = 'Hello';
      }
    });
    return completer.future.then<void>((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: Colors.pink.withOpacity(0.5),
      onRefresh: _handleRefresh,
//      child: ListView.builder(
//        itemCount: 10,
//        itemBuilder: (BuildContext context, int index) {
//          final String item = _items[index];
//          return ListTile(
//            isThreeLine: true,
//            leading: CircleAvatar(child: Text(item)),
//            title: Text('This item represents $item.'),
//            subtitle: Text(
//                'Even more additional list item information appears on line three. '),
//          );
//        },
//      ),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Trending',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'nunito',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    final String item = _items[index];
                    return Container(
                      width: 100,
                      color: Colors.red,
                      margin: EdgeInsets.all(20),
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
