import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Tiles.dart';

class SpecialEvents extends StatefulWidget {
  @override
  _SpecialEventsState createState() => _SpecialEventsState();
}

class _SpecialEventsState extends State<SpecialEvents> {
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
                'Priyanka’s bachelorette party',
                'images/background2.jpg',
                'Priyanka celebrated her bridal shower in Amsterdam.Activities included hanging out on a boat in the famous Amsterdam canals, sipping on mojitos, exploring the city and munching on some late-night eats.n typical form, Chopra looked like ever the fashionista as she and her bridesmaids traipsed around Amsterdam where they wore coordinating outfits most of the time.The bride’s much anticipated dresses included a mix of Indian and Western designers. While white is deemed funereal in India, Priyanka was spotted donning the bridal hue to her shower, where she stunned in a feather-embroidered, midi dress by Marchesa, and in Amsterdam for her bachelorette weekend, where she wore a Georges Chakra mini dress with a feathered duster paired with a Hugo Boss faux fur coat.',
                'Everyone wants to have a little fun before they get married. Lum Events can organize a perfect bachelorette party with all the fun activities with the bride’s close friends and a perfect outfit.',
                'Bachelor\'s'),
            tiles(
                scaffoldState,
                height,
                width,
                'Pippa Middleton’s Secret Party',
                'images/background2.jpg',
                'Taking a private jet with her family and closest friends, they went to a luxury resort in Meribelin France. Harry and other boys, satyed in Meribel and Pippa along with her older sister, Kate, party around 100 miles away fromMeribel. It was a small, private but an amazing party.',
                'Such private bachelorette parties before the wedding are always remarkable. Organizing such parties for royal bride and groom, makes it important for the company to showcase perfection in their works, before their marriage. Perfection in choosing the best venue for the new couples, the food, even the dresses.',
                'Private Party'),
          ],
        ));
  }
}
