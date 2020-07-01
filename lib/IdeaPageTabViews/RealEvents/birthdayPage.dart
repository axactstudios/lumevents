import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lumevents/IdeaPageTabViews/RealEvents/Tiles.dart';

class Birthdays extends StatefulWidget {
  @override
  _BirthdaysState createState() => _BirthdaysState();
}

class _BirthdaysState extends State<Birthdays> {
  double height, width;

  final scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.withOpacity(0.7),
      ),
      body: ListView(
        children: [
          tiles(
              scaffoldState,
              height,
              width,
              'Malaika Arora',
              'images/background2.jpg',
              'Celebrating her birthday in India for the first time in six years, Arora made sure all her closest friends attended her special night. On the guest list were the birthday girl’s sister, Amrita Arora Ladak, along with Kareena Kapoor Khan, Karisma Kapoor and beau Arjun Kapoor. Joining them in striking party looks were Karan Johar, Shweta Bachchan Nanda, Janhvi Kapoor, Akshay Kumar and Twinkle Khanna, Natasha and Adar Poonawalla, Raj and Shilpa Shetty Kundra, AnanyaPanday, Shanaya Kapoor, Tara Sutaria and several others.',
              'lumevents are events professional with creative ideas and solutions which will turn your wedding to a wow memory.',
              'Birthday'),
        ],
      ),
    );
  }
}
