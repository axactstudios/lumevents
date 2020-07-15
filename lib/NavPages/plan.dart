import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lumevents/NavPages/Wishlist.dart';
import 'package:lumevents/NavPages/planWidgets/formFields.dart';
import 'package:lumevents/classes/DatabaseHelper.dart';
import 'package:lumevents/classes/WishlistModel.dart';
import 'package:lumevents/profilePage/User.dart';
import 'package:mailer2/mailer.dart';

import '../theme.dart' as Theme1;

class PlanPage extends StatefulWidget {
  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  final FirebaseAuth mAuth = FirebaseAuth.instance;
  FirebaseUser mCurrentUser;
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final budgetBday = TextEditingController();
  final overview = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final dbRef = FirebaseDatabase.instance.reference().child('Users');

  User userData = User();
  List<WishlistModel> wishlistItems = [];
  List<String> wishes = List<String>();
  final dbHelper = DatabaseHelper.instance;

  void getAllItems() async {
    final allRows = await dbHelper.queryAllRows();
    wishlistItems.clear();
    allRows.forEach((row) {
      wishlistItems.add(WishlistModel.fromMap(row));
    });
    for (int i = 0; i < wishlistItems.length; i++) {
      wishes.add(wishlistItems[i].name);
    }
    setState(() {
      print(wishes.length);
    });
  }

  void removeItem(String name) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.delete(name);
    getAllItems();
  }

  @override
  void initState() {
    super.initState();
    getDatabaseRef();
    getAllItems();
  }

  getDatabaseRef() async {
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
      userData.role = await snap.value['role'];
      setState(() {});
    });
  }

  send() async {
    var options = new GmailSmtpOptions()
      ..username = 'axactstudios@gmail.com'
      ..password = 'dranzer_axactstudios';

    var emailTransport = new SmtpTransport(options);

    // Create our mail/envelope.
    var envelope = new Envelope()
      ..from = 'axactstudios@gmail.com'
      ..recipients.add('axactstudios@gmail.com')
      ..subject = '$dropdownValue ${userData.name} ${DateTime.now()}'
      ..text =
          'Name-${userData.name}\nPhone-${phoneController.text}\nCity-${cityController.text}\nEvent-$dropdownValue\nBudget-${budgetBday.text}\nEvent Date-$finaldate\nOverview- ${overview.text}\nMy Wishlist- ${wishes}';

    // Email it.
    emailTransport
        .send(envelope)
        .then((envelope) => print('Email sent!'))
        .catchError((e) => print('Error occurred: $e'));
  }

  Future<void> sendWed() async {
    var options = new GmailSmtpOptions()
      ..username = 'axactstudios@gmail.com'
      ..password = 'dranzer_axactstudios';

    var emailTransport = new SmtpTransport(options);

    // Create our mail/envelope.
    var envelope = new Envelope()
      ..from = 'axactstudios@gmail.com'
      ..recipients.add('axactstudios@gmail.com')
      ..subject = '$dropdownValue ${userData.name} ${DateTime.now()}'
      ..text =
          'Name-${userData.name}\nPhone-${phoneController.text}\nCity-${cityController.text}\nEvent-$dropdownValue\nBudget-$dropdownValue3\nI am-$dropdownValue1\nEvent Date-$finaldate\nMy Wishlist- ${wishes}';

    // Email it.
    emailTransport
        .send(envelope)
        .then((envelope) => print('Email sent!'))
        .catchError((e) => print('Error occurred: $e'));
  }

  final listOfEvents = [
    "Wedding",
    "Birthday",
    "Corporate Events",
    "Special Events",
    "Other"
  ];
  final listOfYou = ["Bride", "Groom", "Other"];
  final listOfBudgets = [
    "Under 5 lac",
    "5 lac-15 lac",
    "15 lac-30 lac",
    "30 lac-50 lac",
    "50 lac-75 lac",
    "75 lac-1 cr",
    "1 cr+"
  ];
  String dropdownValue = 'Wedding';
  String dropdownValue1 = 'Bride';
  var finaldate;
  String dropdownValue3 = '5 lac-15 lac';
  getUser() async {
    mCurrentUser = await mAuth.currentUser();
    print(mCurrentUser.uid);
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

  void callDatePicker() async {
    var order = await getDate();
    finaldate = order;
    setState(() {
      finaldate = order;
      print(finaldate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  width: 220,
                  child: Text(
                    'Plan Your Event',
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme1.MyColors.themeColor,
                        fontFamily: 'nunito'),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ]),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Wishlist()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme1.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/wishlist.png',
                          scale: 11,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 50,
                          child: Center(
                              child: Text(
                            'My Wishlist',
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
              child: InkWell(
                onTap: () => callDatePicker(),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme1.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: Center(
                          child: finaldate == null
                              ? Text(
                                  'Select Date Of the Event',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'nunito',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  finaldate.toString().substring(0, 10),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'nunito',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: DropdownButtonFormField(
                iconEnabledColor: Theme1.MyColors.themeColor,
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                decoration: InputDecoration(
                  focusColor: Theme1.MyColors.themeColor,
                  labelText: "Select Event Type",
                  labelStyle: TextStyle(
                      color: Theme1.MyColors.themeColor, fontSize: 17),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: listOfEvents.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                style:
                    TextStyle(color: Theme1.MyColors.themeColor, fontSize: 15),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Select type';
                  }
                  return null;
                },
              ),
            ),
            dropdownValue == 'Wedding'
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: DropdownButtonFormField(
                          iconEnabledColor: Theme1.MyColors.themeColor,
                          value: dropdownValue1,
                          icon: Icon(Icons.arrow_downward),
                          decoration: InputDecoration(
                            focusColor: Theme1.MyColors.themeColor,
                            labelText: "You are",
                            labelStyle: TextStyle(
                                color: Theme1.MyColors.themeColor,
                                fontSize: 17),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: listOfYou.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          style: TextStyle(
                              color: Theme1.MyColors.themeColor, fontSize: 15),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Select type';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: DropdownButtonFormField(
                          iconEnabledColor: Theme1.MyColors.themeColor,
                          value: dropdownValue3,
                          icon: Icon(Icons.arrow_downward),
                          decoration: InputDecoration(
                            focusColor: Theme1.MyColors.themeColor,
                            labelText: "Your budget",
                            labelStyle: TextStyle(
                                color: Theme1.MyColors.themeColor,
                                fontSize: 17),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: listOfBudgets.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          style: TextStyle(
                              color: Theme1.MyColors.themeColor, fontSize: 15),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Select type';
                            }
                            return null;
                          },
                        ),
                      ),
                      FormFields(cityController, 'City of event'),
                      FormFields(phoneController, 'Your Active phone number'),
                    ],
                  )
                : Container(),
            dropdownValue == 'Birthday' ||
                    dropdownValue == 'Corporate Events' ||
                    dropdownValue == 'Special Events'
                ? Column(
                    children: [
                      FormFields(budgetBday, 'Your budget'),
                      FormFields(cityController, 'City of event'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 19.5, vertical: 18.0),
                        child: TextFormField(
                          maxLines: 4,
                          minLines: 3,
                          controller: overview,
                          cursorColor: Colors.black,
                          decoration: new InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: 'Brief overview of event',
                              hintStyle:
                                  TextStyle(color: Theme1.MyColors.themeColor)),
                        ),
                      ),
                      FormFields(phoneController, 'Your Active phone number'),
                    ],
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 100.0, top: 20, right: 100, bottom: 100),
              child: InkWell(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    dropdownValue == 'Wedding' ? addWeddingQuery() : addQuery();
                    overview.clear();
                    budgetBday.clear();
                    phoneController.clear();
                    cityController.clear();
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Theme1.MyColors.themeColor,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Center(
                          child: Text(
                        'Go',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'nunito',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addQuery() async {
    await getUser();
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    await ref.child('Queries').child(mCurrentUser.uid).set({
      'Date': finaldate.toString().substring(0, 10),
      'Budget': budgetBday.text,
      'Event': dropdownValue,
      'City': cityController.text,
      'Overview': overview.text,
      'Phone': phoneController.text,
      'Wishes': wishes
    });
    send();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Our team will reach out to you in next 24 hours.'),
    ));
  }

  addWeddingQuery() async {
    await getUser();
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    await ref.child('Queries').child(mCurrentUser.uid).set({
      'Date': finaldate.toString().substring(0, 10),
      'Event': dropdownValue,
      'PersonIs': dropdownValue1,
      'Budget': dropdownValue3,
      'City': cityController.text,
      'Phone': phoneController.text,
      'Wishes': wishes
    });
    sendWed();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Our team will reach out to you in next 24 hours.'),
    ));
  }
}
