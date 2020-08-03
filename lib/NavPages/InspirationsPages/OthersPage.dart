import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart' as Theme;
import 'Tiles.dart';

class Others extends StatefulWidget {
  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
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
              '"SUNRISE TO SUNRISE" CAMPAIGN',
              'https://img.bizbash.com/files/base/bizbash/bzb/image/2016/10/dsc_8141.png?auto=format&w=1200',
              'The Hyatt Centric explorer vending machine is part of the new “Sunrise to Sunrise” campaign that launched earlier this month, positioning the Hyatt Centric brand as a catalyst for local exploration and discovery. The campaign also includes a collaboration with Passion Passport, a community of travellers, storytellers and creative inspiring exploration and discovery.',
              'Our company can also host such things in its events as people like to win the prizes in lucky draws and it will be a better experience for them.',
              'Conference'),
          tiles(
              scaffoldState,
              height,
              width,
              'TED@INTEL BY MARIA BEZAITIS',
              'https://pi.tedcdn.com/r/talkstar-photos.s3.amazonaws.com/uploads/bdc0ea06-b1f0-4808-ada2-7c01c88d837b/MariaBezaitis_2013S-stageshot.jpg?c=1050%2C550&w=1050',
              'In our digital world, social relations have become mediated by data. Without even realizing it, we\'re barricading ourselves against strangeness -- people and ideas that don\'t fit the patterns of who we already know, what we already like and where we\'ve already been. Maria Bezaitis makes a bold call for technology to deliver us to what and who we need, even if it\'s unfamiliar and strange.',
              'Our company can also host TED talks with a diverse range of topics to choose in its events which will help us to gain a lot popularity among the corporate companies and people.',
              'Talks'),
          tiles(
              scaffoldState,
              height,
              width,
              'India International Yarn Exhibition',
              'https://www.jbecotex.com/ckfinder/userfiles/images/YARNEX,%20Delhi,%20%2015-16-17%20July%2020191.jpg',
              'YARNEX is the only exhibition of its kind in the region that brings together under one roof manufacturers and suppliers of fibres, yarns and related services.',
              'The fact that the exhibition is related to same type of people under one roof discussing/ making & offering deals/ planning strategies for buying, selling, distributions and production is what makes it interesting. This is a way that helps us to find what we are looking for under one roof only. It seems economical in terms of time, cost and effort. This is a more simplified and unique method. Ensuring such kind of specialisation is required by us as well. We can surely use this as an idea.',
              'Exhibition'),
          tiles(
              scaffoldState,
              height,
              width,
              'India International Trade Fair',
              'https://akm-img-a-in.tosshub.com/indiatoday/trade-fair-647_111517031459.jpg?_KUf5SrOQUnRWfidOlE7Ot1sngEH_yaR',
              'The fair displays comprises a wide range of products and services including automobiles, coir products, jute, textiles, garments, households appliances, kitchen appliances, processed food, beverages, confectionary, pharmaceuticals, chemicals, cosmetics, body care & health care products, telecommunication, power sector, electronic sector, furniture, home furnishings, sporting goods, toys, and engineering goods.',
              'Social Responsibility, Sustainable Development & Global Relations are the 3 key features which can be used by our organisation. Thus this will help us provide solutions to all our problems. This fair is the most trending and most popular of all times due to alot of people being part of it. It has visitors from 56+ countries.',
              'Fair'),
          tiles(
              scaffoldState,
              height,
              width,
              'Cybage Run',
              'https://s3.ap-south-1.amazonaws.com/townscript-production/gallery-images/1207886/1022e931-8ec3-4dd6-acf9-20096c2203af.jpg',
              '“RUN A MILE, EDUCATE A CHILD”, is the slogan so as to celebrate the success stories of underprivileged children.',
              'Cybage software Pvt Ltd is therefore very popular because of not just providing for and achieving economic objectives but also fulfilling social objectives which very enterprise must undertake. So by looking at what the market/ society demands from us, we should provide for these changes or get in touch with experts in such feild to fulfil this responsibility. Therefore, by arranging for online/ offline seminars can prove to be quite useful and attract alot of people/ customers.',
              'Run'),
          tiles(
              scaffoldState,
              height,
              width,
              'THE SOCIAL SWIPE',
              'https://innovationbestof.files.wordpress.com/2018/04/misereor_placard_bild_2-2560x1665.jpg',
              '	Globally, an estimated 357 billion non-cash transactions are made each year. And knowing how often we whip out our cards, German relief NGO MISEREOR decided to put our bad habit to good use with its charitable giving billboard.',
              'Our company can implement such ideas in its campaigns and events and will show how our company takes a stand on the social views in a creative way. This type of Viral Marketing is non-controversial & inspirational among the society and is a positive way to be on the trending list.',
              'Campaign/Ad'),
          tiles(
              scaffoldState,
              height,
              width,
              'International Conference on Marketing and Business Development',
              'https://img.youtube.com/vi/ps__K7ZHWXQ/mqdefault.jpg',
              'They talked about different strategies and tactics used in the field. Multiple well-known keynote speakers were invited. Discussed career and growth in the field',
              'Our company can also host such things in its events as people like to win the prizes in lucky draws and it will be a better experience for them. Educational, professional and career related conferences and events garner a huge population especially of those who have just started off. This is what makes the market huge. This audience should be targeted.',
              'Conference'),
        ],
      ),
    );
  }
}
