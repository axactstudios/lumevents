import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:lumevents/IdeaPageTabViews/RealEvents/PullUps.dart';

Widget tiles(
  scaffoldState,
  height,
  width,
  name,
  image,
  descr,
  why,
  type,
) {
  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      scaffoldState.currentState.showBottomSheet((context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter state) {
          return UIWeddings(
              name, image, descr, why, type, context, height, width);
        });
      });
    },
    child: Container(
      height: 274,
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
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.fromLTRB(width * 0.05, 20, width * 0.05, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            height: 60,
            width: width * 0.9,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FittedBox(
                      child: Text(
                        type,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'nunito',
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      width: width * 0.85,
                      color: Colors.white,
                      child: Text(
                        name,
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
            width: width * 0.9,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: GFImageOverlay(
                height: 200,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        descr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'nunito'),
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: NetworkImage(image),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
