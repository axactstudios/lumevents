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
              'AaradhyaBachchan',
              'images/background2.jpg',
              'Dressed in  a  pink gown, Aaradhya looked like a doll as she posed with her friends and mom, Aishwarya.',
              'lumevents are events professional with creative ideas and solutions which will turn your wedding to a wow memory.',
              'Birthday'),
          tiles(
            scaffoldState,
            height,
            width,
            'Malaika Arora',
            'images/background2.jpg',
            'Celebrating her birthday in India for the first time in six years, Arora made sure all her closest friends attended her special night. On the guest list were the birthday girl’s sister, Amrita Arora Ladak, along with Kareena Kapoor Khan, Karisma Kapoor and beau Arjun Kapoor. Joining them in striking party looks were Karan Johar, Shweta Bachchan Nanda, Janhvi Kapoor, Akshay Kumar and Twinkle Khanna, Natasha and Adar Poonawalla, Raj and Shilpa Shetty Kundra, AnanyaPanday, Shanaya Kapoor, Tara Sutaria and several others.',
            'lumevents are events professional with creative ideas and solutions which will turn your wedding to a wow memory.',
            'Birthday',
          ),
          tiles(
              scaffoldState,
              height,
              width,
              'Leonardo DiCaprio’s star-studded birthday bash',
              'images/background2.jpg',
              'The thing most spoken about in this party was that the dinner was on the Spring Place rooftop. Reports said 500 guests attended the blowout that followed a smaller dinner for 50 where VIPs included Oprah Winfrey.',
              'Having a birthday in a rooftop venue is not that common in India. If Lum events finds places with a rooftop for events like birthday and anniversaries in winters it will be something unique for the clients.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Arjun Kapoor’s birthday bash',
              'images/background2.jpg',
              'Arjun Kapoor had a dinner party with his close Bollywood friends and relatives. Arjun Kapoor’s birthday on June 26 was a happy affair as BoneyKapoor’s khandaan congregated at the actor’s residence for the birthday party.',
              'Lum events can organize simple dinner party with close friends and relatives. These party can be casual where people can dress simple like Janhvi Kapoor. These simple dinner parties not only makes the birthday special but also gives an opportunity for everyone to talk openly without any disturbance of loud music. Lum events can also take care of hiring people for the properly servicing food on the table so that everyone can just sit, relax,eat and talk.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'HirooJohar’s birthday bash',
              'images/background2.jpg',
              'The party was a huge success and it was event featured in Vogue Magazine. The decoration and the cake were one of many things that went popular. Decorated with elegant pink blooms, the afternoon\'s special highlight had to be Sonu Nigam\'s musical performance for HirooJohar. The celebration ended with HirooJohar cutting her floral-detailed three tier cake surrounded by her favourite people.',
              'A simple venue can also be made beautiful with a pretty flower and an attractive cake. Calling singers to a birthday party and matching the decoration to the cake seems to be lie a good idea. Lum events can take inspiration from this beautiful decoration and think of more creative decoration ideas for their clients. The pictures clicked with the decoration is spoken about even after years which will increase Lum event’s goodwill.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Drake\'sThemed Birthday Party',
              'images/background2.jpg',
              'Drake’s birthday had a quirky theme party with an exclusive section for his blockbuster video and another section for his mad cool airbrushed shirts featuring Drake as a young. The cups used in the party werepersonalized and had “up in the stupid me and my drank” written on them which was very unique in the early 2000s.There were many popular people seen at the party ,dressed according to the theme as seen in the pictures provided in he link below.',
              'When a person wants to do something unusual on their birthdays they hire planners to organize it. Having such distinct theme parties with something new such as their picture t-shirts,personalized Cutlery and smartly placed picture clicking spots Can make an event go very popular. This can increase the company’s popularity as well.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              ' Beyonce’s themed birthday party',
              'images/background2.jpg',
              'Beyonce’s Soul Train- themed 35th birthday party was the event of the year, and all the stars flocked in to The Big Apple to bow down for the Queen Bey on her special day.',
              'Having a theme birthday part will make the birthday   interesting   and  memorable. Since nowadays birthday parties are common, lumevents can arrange a theme birthday party which will make the day memorable for the birthday boy or girl.',
              'Birthday'),
        ],
      ),
    );
  }
}
