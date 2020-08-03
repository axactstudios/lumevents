import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart' as Theme;
import 'Tiles.dart';

class SpecialEvents extends StatefulWidget {
  @override
  _SpecialEventsState createState() => _SpecialEventsState();
}

class _SpecialEventsState extends State<SpecialEvents> {
  List<String> imageURLs = [
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Special%20Events%2F80.jpg?alt=media&token=21ed11f5-ce80-4fbc-80b0-3bba87762383',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Special%20Events%2F81.jpg?alt=media&token=363ce645-6723-4747-a036-d93f5a58f9d0',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Special%20Events%2F82.jpg?alt=media&token=6c2c9d65-b91d-44ab-b988-25079e357e1e',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Special%20Events%2F83.jpg?alt=media&token=73a1e363-4d02-4ddc-82bd-b79f870f5f88',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Special%20Events%2F84.jpg?alt=media&token=cbe34a65-b144-480d-8b3f-977901e6cff5',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Special%20Events%2F85.jpg?alt=media&token=3b03d929-3762-4d2f-9c6d-7a740d992ef0',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Special%20Events%2F86.jpg?alt=media&token=36fc7a1c-7fe0-4a05-afd3-e0f2fdef872c',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Special%20Events%2F87.jpg?alt=media&token=cc4406e5-1a25-41f8-8326-ff92d0e1a40c',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Special%20Events%2F88.jpg?alt=media&token=784f7a4d-c132-4224-8701-65ee77661ed8',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Special%20Events%2F89.jpg?alt=media&token=e1f73827-ad8e-4306-9707-bcb0b3d8e3a7',

  ];
  double height, width;

  final scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: scaffoldState,
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Theme.MyColors.themeColor,
            ),
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
        body: ListView(
          children: [
            tiles(
                scaffoldState,
                height,
                width,
                "Sherlock	Holmes	Theme Party",
                imageURLs[0],
                "The party theme can be something like Sherlock Holmes Theme Party. Everyone can dress up like the characters of the original series. The house can be decorated with skulls, detective gear, old typewriters and tea sets. There can also be a murder mystery game and scenes created from the book.",
                "A theme like this is very unique and perfect for Sherlock Holmes’s	fans. Lum events can not only plan the decoration but also help with the mystery game idea.",
                'Party'),
            tiles(
                scaffoldState,
                height,
                width,
                "Farmer's Market Themed Party",
                imageURLs[1],
                "From the adorable farmer’smarket-inspired party table stands to the darling floral print signage + stationery, this party is full of fabulous ideas that could be perfect for any outdoor bash! This party is full of fabulous ideas that could be perfect for anyoutdoor bash!",
                "Originally designed for a child, this theme is totally do- able for hipster types who love to their fresh market veggies. Lum events can surely do an outdoor birthday like this.",
                'Party'),
            tiles(
                scaffoldState,
                height,
                width,
                "Jimmy Buffett Themed Surprise Party",
                imageURLs[2],
                "Paradise” cheeseburgers, french fried potatoes with Heinz 57, Margaritaville cake pops, “Nibbling on sponge cake” cupcakes topped with themed fondant toppers like parrots & salt shakers and much more all inspired by Jimmy’s songs.",
                "Not only JB’s fans but also food loves aregoing to love this kind of party. Lum events can do a party with this amazing customized food according to Jimmy’s songs.",
                'Party'),
            tiles(
                scaffoldState,
                height,
                width,
                "Marie Antoinette Party",
                imageURLs[3],
                "Marie Antoinette cake table accentedwith a vintage dress form,Crowned Marie Antoinette-inspired cake ,Elegant place settings featuringsatin napkins and gold chargers,Guest tables topped withsequin linens and lined with gold chiavari chairs,Royal crown for the guest of honor,And an array of dreamy desserts!",
                "Everybody wants to have a birthday like a queen and Lum events can make this happen by having a theme Inspired by queen Marie Antoinette.",
                'Party'),
            tiles(
                scaffoldState,
                height,
                width,
                "Stylish Backyard Beer Bash ",
                imageURLs[4],
                "Twine	wrapped		bottles	with	dried wheat,Guinness & Blue Moon Beer Cupcakes,Fresh popcorn	favors	in		simple	bags	tied		with		teal twine,Pulled Pork Sliders & Root-Beer Floats and Beer Pong Trophies are the main highlight.",
                "This way the birthday boy or girl has a special gift they could take back with them with all the best wishes written on them. This easy to arrange idea can surely be implemented by Lum events.",
                'Party'),
            tiles(
                scaffoldState,
                height,
                width,
                "Stranger Things Themed Party",
                imageURLs[5],
                "Stranger things is one the most popular Netflix Series.Having a theme party based on a popular series can be a great idea. The guest can dressed up like a particular character from the series and the decoration can be inspired from the show as well.",
                "Lum events can provide the perfect decoration required to Implement such a theme inspired by a show.",
                'Party'),
            tiles(
                scaffoldState,
                height,
                width,
                "Marilyn Monroe Themed Party",
                imageURLs[6],
                "Marilyn Monroe was an American actress, model, and singer.The decoration can be related to here and the guest can dress up inspired by her dressing.This Marilyn Monroe-inspired birthday party was featured on Catch My Party and will have you singing 'Happy Birthday, Mr. President!' ",
                "People who are really big fan of Marilyn Monroe Would surely like to have a birthday theme inspired by her. Lum events can help with the decoration and the sings all inspired by her, apart from the catering service and hall booking. ",
                'Party'),
            tiles(
                scaffoldState,
                height,
                width,
                "Camp themed wedding",
                imageURLs[7],
                "camp themed wedding is simply unique and whimsical. There are so many ways to spin a camp-themed wedding. like custom camping flags commemorating shared last name, creative escort cards, and true-to-theme invitations to rally the fellow campers.",
                "A simple and unique way to organise a wedding inspired by nature which will make couple happy.",
                'Party'),
            tiles(
                scaffoldState,
                height,
                width,
                "Chalk out love story",
                imageURLs[8],
                "couples can write down their love story and letthe guests know about how they met or when they proposed, etc. They can write it all down for them to read on a black board and with some colourful chalks.",
                "This is an existing way to represent love story of the couple.",
                'Party'),
            tiles(
                scaffoldState,
                height,
                width,
                "Live painter",
                imageURLs[9],
                "Hire an artist to live paint your ceremony. They’ll create a work of art out of the happiest day of your life that they can hang on the walls their future home and treasure for years",
                "This will make the couples day more memorable and special.",
                'Party'),


          ],
        ));
  }
}
