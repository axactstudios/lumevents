import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lumevents/classes/DatabaseHelper.dart';
import 'package:lumevents/classes/WishlistModel.dart';
import 'package:lumevents/profilePage/User.dart';
import 'package:mailer2/mailer.dart';

import '../../theme.dart' as Theme;

final dbHelper = DatabaseHelper.instance;
final dbRef = FirebaseDatabase.instance.reference().child('Users');
final FirebaseAuth mAuth = FirebaseAuth.instance;
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

User userData = User();

send(numberv, namev) async {
  FirebaseUser user = await mAuth.currentUser();
  String uid = user.uid;
  var ref = dbRef.child(uid);
  DatabaseReference dbref =
      FirebaseDatabase.instance.reference().child('Users').child(uid);
  await dbref.once().then((DataSnapshot snap) async {
    // ignore: non_constant_identifier_names
    userData.name = await snap.value['name'];
    userData.number = await snap.value['number'];
    userData.email = await snap.value['email'];
  });
  var options = new GmailSmtpOptions()
    ..username = 'axactstudios@gmail.com'
    ..password = 'dranzer_axactstudios';

  var emailTransport = new SmtpTransport(options);

  // Create our mail/envelope.
  var envelope = new Envelope()
    ..from = 'axactstudios@gmail.com'
    ..recipients.add('axactstudios@gmail.com')
    ..subject = 'Vendor Enquiry  ${DateTime.now()}'
    ..text =
        'Vendor Name-$namev\nVendor Phone Number-$numberv\nCustomer Name-${userData.name}\nCustomer Number- ${userData.number}';

  // Email it.
  emailTransport
      .send(envelope)
      .then((envelope) => print('Email sent!'))
      .catchError((e) => print('Error occurred: $e'));
}

Widget UIVendors(String brand, city, description, imageUrl, pricing, specs,
    phone, type, BuildContext context, double height, width, List portfolio) {
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brand,
                    style: TextStyle(
                        color: Theme.MyColors.themeColor,
                        fontFamily: 'nunito',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    city,
                    style: TextStyle(
                        color: Theme.MyColors.themeColor.withOpacity(0.6),
                        fontFamily: 'nunito',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
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
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                              imageUrl,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 150,
                            child: Column(
                              children: [
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Price Range-',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'nunito',
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        pricing,
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
                      Text(
                        'Speciality-',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'nunito',
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        specs,
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
                      Text(
                        'Vendor Gallery-',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'nunito',
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      portfolio != null
                          ? Container(
                              height: height * 0.5,
                              width: double.infinity,
                              child: StaggeredGridView.countBuilder(
                                crossAxisCount: 4,
                                itemCount: portfolio.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        new Container(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    child: Image.network(
                                      portfolio[index].toString(),
                                      alignment: Alignment.center,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                staggeredTileBuilder: (int index) =>
                                    new StaggeredTile.fit(2),
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              child: Text(
                                'Vendor has not uploaded any images',
                                textAlign: TextAlign.center,
                              ),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            await send(phone, brand);
            FlutterOpenWhatsapp.sendSingleMessage('+91$phone',
                'Hi! I connected with you through the supercool app dream thy eve!');
          },
          child: Card(
            color: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Connect on Whatsapp',
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
        InkWell(
          onTap: () {
            addToWishlist(name: brand, extras: type);
          },
          child: Card(
            color: Theme.MyColors.themeColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
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
      ],
    ),
  );
}
