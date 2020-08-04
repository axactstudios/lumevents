import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart' as Theme;
import 'Tiles.dart';

class Birthdays extends StatefulWidget {
  @override
  _BirthdaysState createState() => _BirthdaysState();
}

class _BirthdaysState extends State<Birthdays> {
  double height, width;

  final scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<String> imageURLs = [
      'https://filmfare.wwmindia.com/content/2015/Nov/thumb_1447759874.jpg',
      'https://images.news18.com/ibnlive/uploads/2019/10/Malaika-Aroras-Starry-Birthday-Party-11.jpg?impolicy=website&width=875&height=0',
      'https://cdn.newsapi.com.au/image/v1/c44ce921f60ea6b2a9945fb0b20045d6',
      'https://images.indianexpress.com/2018/06/arjun-kapoor-birthday-759.jpg',
      'https://peepingmoon.com/wp-content/uploads/2018/03/Hiroo-Johar-Birthday1.jpg',
      'https://media.guestofaguest.com/t_article_content/gofg-media/2016/09/1/47508/screen_shot_2016-09-06_at_12.17.36_pm.png',
      'https://akns-images.eonline.com/eol_images/Entire_Site/2019725/rs_1024x727-190825091554-1024-sofia-richie-birthday-8-vegas-cjh-082419.jpg?fit=around|1024:auto&output-quality=90&crop=1024:auto;center,top',
      'https://akns-images.eonline.com/eol_images/Entire_Site/2019515/rs_634x1024-190615152644-634-kourtney-kardashian-candy-land-birthday-party-north-west-penelope-disick-cjh-061519.jpg?fit=around|634:auto&output-quality=90&crop=634:auto;center,top',
      'https://www.wmagazine.com/wp-content/uploads/2019/12/16/5df7a7b1b8d92900086d29fc_GettyImages-1194059797.jpg?crop=0px,0px,3530px,1765px&w=1600px',
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/stormiworld-1549799907.jpg?crop=0.501xw:1.00xh;0,0&resize=768:*',
      'https://karaspartyideas.com/wp-content/uploads/2017/09/Sherlock-Holmes-Murder-Mystery-Party-via-Karas-Party-Ideas-KarasPartyIdeas.com8_.jpg',
      'https://karaspartyideas.com/wp-content/uploads/2016/06/Shabby-Chic-Farmers-Market-Birthday-Party-via-Karas-Party-Ideas-KarasPartyIdeas.com43.jpg',
      'https://karaspartyideas.com/wp-content/uploads/2017/09/Queen-Marie-Antoinette-30th-Birthday-Party-via-Karas-Party-Ideas-KarasPartyIdeas.com10.jpg',
      'https://i.pinimg.com/236x/4a/67/bb/4a67bb7f91edbebb4d32dcaf400e99cc--donut-games-fun-games.jpg',
      'https://i.pinimg.com/236x/c6/02/10/c6021087abcd1146285561fc37a886ce--anniversary-parties-th-birthday-parties.jpg',
      'https://hosting.photobucket.com/albums/vv298/theliebertfamily/A2014/A2014019/Fall%20Coffee%20Bar%20and%20Doughnut%20Party%20StarbucksCaffeLatte%20MyStarbucksatHome_zps81acrbzx.jpg',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Farabian.jpg?alt=media&token=1782b33d-4eb8-4265-832a-48bf6627831f',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fdark.jpg?alt=media&token=3a404861-9257-49d8-b722-40f0089331ca',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fart.jpg?alt=media&token=0adbffa3-72eb-4aed-993b-5075d445cb70',
      'https://i1.wp.com/www.themanylittlejoys.com/wp-content/uploads/2018/05/Lego-birthday-party-cupcakes.jpg?w=720&ssl=1',
      'https://i.pinimg.com/originals/f1/81/fb/f181fbf743428d5f230b69e7ec1c9e91.jpg',
      'http://curlytales.com/wp-content/uploads/2017/10/shutterstock_604662734-e1508932071514.jpg',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fscavenger.png?alt=media&token=32a09086-7e7e-46ca-a6df-def43267a68d',
      'https://i.pinimg.com/originals/e9/4e/7e/e94e7e0ff54ea1b1c73032bc9e3cc638.jpg',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fmovie.png?alt=media&token=eb4feb4f-795d-4b5a-95b9-e94f2a9445ed',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fgatbsy.png?alt=media&token=517bf852-fcd6-4777-b72e-68df5efb1024',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fchef.png?alt=media&token=22e2dc1e-92c6-4367-8169-253e804c1efd',
      'https://blog-whpartysupplies-com-weblinc.netdna-ssl.com/blog/wp-content/uploads/2017/10/Stranger-Things-Party-Invite-2.jpg',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Ftheme.png?alt=media&token=fbbcc47c-1bda-4173-a166-488d39143050',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Ffood.png?alt=media&token=c6c4a452-739c-4a37-b074-b7de84a074fc',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fcake.png?alt=media&token=cfbdc3bd-4a94-4212-b393-21aa700f2e7e',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fdino.png?alt=media&token=908e887e-d259-4597-82bb-3827cc5c0330',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fpaint.png?alt=media&token=95ca33db-777e-47b2-b12f-c94dd13da5cf',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Ffire.png?alt=media&token=ba71a366-a294-44c4-9ca8-5f8219ad3d9c',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fpoker.png?alt=media&token=55bcf9f1-479d-4d0d-a9d5-7cb3c91e2ca2',
      'https://cdn-tp2.mozu.com/16647-m1/cms/files/b3764359-6ea6-4fca-ba25-9d55dd20282b',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fwinter.png?alt=media&token=aa3f7748-6fb2-402a-adb4-6133fcaf2e76',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fhiphop.png?alt=media&token=332af9f7-261b-4075-b1f9-b1d891700ae9',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2F80.png?alt=media&token=53fbc5c5-5b8e-42fd-9e12-a1dccf3c8502',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Fcarnival.png?alt=media&token=7315dc45-30e7-439a-a015-2e2340a003d0',
      'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Birthdays%2Ffiesta.png?alt=media&token=a39b7938-c43b-43e4-a6ab-a8be16a0cb68',
      'https://karaspartyideas.com/wp-content/uploads/2019/05/Game-of-Thrones-Party-via-Karas-Party-Ideas-KarasPartyIdeas.com7_.jpg',
    ];

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Image.asset(
                'images/dreamthyeve.png',
                scale: 26,
              ),
              Spacer(),
              Text(
                'Inspirations',
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.MyColors.themeColor,
                    fontFamily: 'nunito'),
                textAlign: TextAlign.left,
              ),
              Spacer()
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          tiles(
              scaffoldState,
              height,
              width,
              'Aaradhya Bachchan',
              imageURLs[0],
              'Dressed in  a  pink gown, Aaradhya looked like a doll as she posed with her friends and mom, Aishwarya.',
              'lumevents are events professional with creative ideas and solutions which will turn your wedding to a wow memory.',
              'Birthday'),
          tiles(
            scaffoldState,
            height,
            width,
            'Malaika Arora',
            imageURLs[1],
            'Celebrating her birthday in India for the first time in six years, Arora made sure all her closest friends attended her special night. On the guest list were the birthday girl’s sister, Amrita Arora Ladak, along with Kareena Kapoor Khan, Karisma Kapoor and beau Arjun Kapoor. Joining them in striking party looks were Karan Johar, Shweta Bachchan Nanda, Janhvi Kapoor, Akshay Kumar and Twinkle Khanna, Natasha and Adar Poonawalla, Raj and Shilpa Shetty Kundra, AnanyaPanday, Shanaya Kapoor, Tara Sutaria and several others.',
            'lumevents are events professional with creative ideas and solutions which will turn your wedding to a wow memory.',
            'Birthday',
          ),
          tiles(
              scaffoldState,
              height,
              width,
              'Leonardo DiCaprio’s star-studded birthday bash',
              imageURLs[2],
              'The thing most spoken about in this party was that the dinner was on the Spring Place rooftop. Reports said 500 guests attended the blowout that followed a smaller dinner for 50 where VIPs included Oprah Winfrey.',
              'Having a birthday in a rooftop venue is not that common in India. If Lum events finds places with a rooftop for events like birthday and anniversaries in winters it will be something unique for the clients.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Arjun Kapoor’s birthday bash',
              imageURLs[3],
              'Arjun Kapoor had a dinner party with his close Bollywood friends and relatives. Arjun Kapoor’s birthday on June 26 was a happy affair as BoneyKapoor’s khandaan congregated at the actor’s residence for the birthday party.',
              'Lum events can organize simple dinner party with close friends and relatives. These party can be casual where people can dress simple like Janhvi Kapoor. These simple dinner parties not only makes the birthday special but also gives an opportunity for everyone to talk openly without any disturbance of loud music. Lum events can also take care of hiring people for the properly servicing food on the table so that everyone can just sit, relax,eat and talk.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Hiroo Johar’s birthday bash',
              imageURLs[4],
              'The party was a huge success and it was event featured in Vogue Magazine. The decoration and the cake were one of many things that went popular. Decorated with elegant pink blooms, the afternoon\'s special highlight had to be Sonu Nigam\'s musical performance for HirooJohar. The celebration ended with HirooJohar cutting her floral-detailed three tier cake surrounded by her favourite people.',
              'A simple venue can also be made beautiful with a pretty flower and an attractive cake. Calling singers to a birthday party and matching the decoration to the cake seems to be lie a good idea. Lum events can take inspiration from this beautiful decoration and think of more creative decoration ideas for their clients. The pictures clicked with the decoration is spoken about even after years which will increase Lum event’s goodwill.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Beyonce’s themed birthday party',
              imageURLs[5],
              'Beyonce’s Soul Train- themed 35th birthday party was the event of the year, and all the stars flocked in to The Big Apple to bow down for the Queen Bey on her special day.',
              'Having a theme birthday part will make the birthday   interesting   and  memorable. Since nowadays birthday parties are common, lumevents can arrange a theme birthday party which will make the day memorable for the birthday boy or girl.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Sofia Riche\'s 21st Birthday Bash',
              imageURLs[6],
              'Sofia Riche celebrated her 21st Birthday with her friends in a pretty pink themed birthday party at XS NightClub, Wynn Las Vegas ,along with dance and beach party at Encore BeachClub at Wynn Las Vegas.',
              'LumEvents can organize upcoming royal parties taking and implementing ideas from Sofie\'s BirthDay Party. 6 -tier cake,dance , photo booth, cocktails etc.Matching dress is now a days, the most popular trends in any such events.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              '	North Westand Penelope Disickcandylandthemed Birthday Party',
              imageURLs[7],
              'Kim Kardashian and Kourtney Kardashian\'s celebration for their girls was literally the sweetest. Kardashians stars threw their girls a double party, and this year\'s theme was the popular Hasbro board game Candy  Land.  North turned 6 on Saturday and Penelope turns 7 next month.',
              'Such themed party, are trending these days. The way North’s and Disick’s B’day was celebrated, where everything is of candy, makes their party unique in itself. LumEvents can take ideas for organizing birthday parties in a different exciting way.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Diddy’s 50th Birthday Bash ',
              imageURLs[8],
              'Diddy is not a man to cater to convention so, even though his actual 50th birthday was back in November, he chose to hold a bash in Beverly Hills on December 14 to celebrate.',
              'Such famous parties remain in media for longer times. Organizing these parties in a exaggerating way, makes it more staring. Lumevents can takes ideas from such parties, and implements in their upcoming events.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Stormi Webster’s First Birthday Party',
              imageURLs[9],
              'Kylie Jenner Built Stormi an Entire Theme Park to Celebrate Her First Birthday Party. Proving that even babies also deserve to celebrate their birthdays in style, Kylie Jenner threw the most lavish party as Stormi Webster turned one.a low-key rainbow-themed party, which was forced indoors due to bad weather, Kylie decided to go all-out for her baby\'s birthday',
              'LumEvents can take ideas from Stormi’s first Birthday Party, to organize events in a spectacular form, in their upcoming parties.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Sherlock Holmes Theme Party',
              imageURLs[10],
              'The party theme can be something like Sherlock Holmes Theme Party. Everyone can dress up like the characters of the original series. The house can be decorated with skulls, detective gear, old typewriters and tea sets. There can also be a murder mystery game and scenes created from the book.',
              'A theme like this is very unique and perfect for Sherlock Holmes’s	fans. Lum events can not only plan the decoration but also help with the mystery game idea.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              '	Farmer\'s Market Themed Party',
              imageURLs[11],
              ' From the adorable farmer’s market-inspired party table stands to the darling floral print signage + stationery, this party is full of fabulous ideas that could be perfect for any outdoor bash! This party is full of fabulous ideas that could be perfect for any outdoor bash!',
              'Originally designed for a child, this theme is totally do- able for hipster types who love to their fresh market veggies. Lum events can surely do an outdoor birthday like this.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Marie Antoinette Party',
              imageURLs[12],
              'Marie Antoinette cake table accented with a vintage dress form,Crowned Marie Antoinette-inspired cake ,Elegant place settings featuringsatin napkins and gold chargers,Guest tables topped withsequin linens and lined with gold chiavari chairs,Royal crown for the guest of honor,And an array of dreamy desserts!',
              'Everybody wants to have a birthday like a queen and Lum events can make this happen by having a theme Inspired by queen Marie Antoinette.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Donut Game',
              imageURLs[13],
              'A game of hanging the Donuts up with a ribbon and eating them without Touching it with your hand.This game can be set up in an outdoor birthday party.',
              'Everyone loves donuts and having an unique exciting Game like this can make the party interesting. And LumEvents can easily arrange for this game.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Stylish Backyard Beer Bash ',
              imageURLs[14],
              'Twine	wrapped		bottles	with	dried wheat,Guinness & Blue Moon Beer Cupcakes,Fresh popcorn	favors	in		simple	bags	tied		with		teal twine,Pulled Pork Sliders & Root-Beer Floats and Beer Pong Trophies are the main highlight.',
              'This way the birthday boy or girl has a special gift they could take back with them with all the best wishes written on them. This easy to arrange idea can surely be implemented by Lum events.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              '	Fall Coffee Bar',
              imageURLs[15],
              'A party with a gorgeous coffee bar full of fall treats for warm beverages to serve at your hot birthday party.',
              'The perfect party for all the coffee Lovers. Lum event can arrange a Coffee bar like this as the highlight of a Birthday party.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Arabian Theme Party',
              imageURLs[16],
              'A party where the guest dress up like Arabic people and the decoration consist of a desert houses. Belly dancers, tattoo card reader and Mehndiwalis can also be arranged.',
              'Who won’t want a theme like the Aladdin and Jasmine? But it’s difficult to arrange all these things for a perfect Arabian theme party. Here is where Lum events can come to the rescue.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Glow in Dark',
              imageURLs[17],
              'When the lights go off objects like hand bands, balloons, table ends etc glow. It looks really spectacular.',
              'This is an amazing theme for a birthday party.Lum events can find a perfect venue for a glow party and arrange objects that can glow in the dark.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Kids Art Themed Party',
              imageURLs[18],
              'An art and craft display table, food Plating inspired by paints, creative juice Station, crafting table with all the art and craft Material.',
              'Lum events can think of perfect ideas suitable for the theme decoration, plating, cake and the Art and craft activities for the kids.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Lego Birthday Party',
              imageURLs[19],
              'Lego toy inspired decoration, plating,food toppings if possible, cake can be arranged.',
              'Kids love Lego. Lum events can arrange for the perfect decoration and other things inspired by Lego.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'A Toy Story Inspired Joint Birthday Party',
              imageURLs[20],
              'Kids love the movie toy story and having a theme inspired by it will make him happy. Guest can dress up like the characters of the movie. And there can be Toystory cake and toys for the party.',
              'Lum events can arrange for the perfect decoration for the party and make the birthday special.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              '	Boat Party',
              imageURLs[21],
              'Rent a boat or a mini-yacht by the shore side and invite all your friends.Cook up a barbecue on the yacht or simply order some food and drinks along with it. You can have a music system, or rent a movie and simply sail along the ocean with your friends. A wonderful way to spend your birthday',
              'Yacht parties are not very famous but having a yacht party can be a lot of fun. Lum events should give this idea to their clients and help them organize a yacht party with music ,drinks,food and amazing decoration.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Scavenger Hunt Party',
              imageURLs[22],
              'Scavenger Hunt is a game that can not only be played in a kids birthday party but also and adult birthday party in a bar. The basic premise of a Scavenger hunt is to hide several prizes and clues either indoors or outdoors.',
              'Such games are fun and unique. It keeps the invitees engaged and gives an opportunity for people to bond. Lum events should surely organize such game parties for their clients.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Ugly sweater slumber party',
              imageURLs[23],
              'If the birthday is in winters someone can keep a party with this unique theme. People don’t have to dress up in these parties, the can just come in the sweaters and pajamas with a tinch of Christmas theme.',
              'Such parties are not that common in India. But having such a party will be very unique and Lum events can even help their clients with the Christmas decoration of their house for the party as well.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Movie screening party',
              imageURLs[24],
              '	Rent out a theater at your local cineplex ,decorate a little and ask them to play your favourite movie. Hand out the popcorn, candy, slushies,etc., as snacks. Same can be done at your house or a party hall by organizing a Projector,putting great lightning decoration , putting some bean bags and catering food.',
              'Lum events can arrange for a projector and decorate Their client’s house or a party hall for the movie and they can have an amazing birthday party watching their favourite movie with their friends.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Gatsby Party',
              imageURLs[25],
              '	The Great Gatsby is a popular novel by F. Scott Fitzgerald. Guest are suggested to dress in flapper dresses, pearls, feathers, dapper suits, and silk scarves. Decoration can include old streamers or ribbons. A singer or band can also be hired to play swing and jazz at the party',
              'Organizing a Gatsby party can be very different that’s where Lum events can come to the rescue.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'MasterChef Party',
              imageURLs[26],
              'Some hotels gives you and your guests a chance to cook a fancy dish and eat it too. Host a barbeque party or create works of  art with icing and sprinkles on short-crust pastry and let your foodie friends and family have a ball of a time at this food studio.',
              ' This is  the perfect birthday idea for a food lover. Lum events can either find such places where they organize such parties or help the customer to organize such parties at their home or a party hall.Even actors go for these kind of fun food making parties.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              '"Stranger Things" Themed Party',
              imageURLs[27],
              'Stranger things is one the most popular Netflix Series.Having a theme party based on a popular series can be a great idea. The guest can dressed up like a particular character from the series and the decoration can be inspired from the show as well.',
              'Lum events can provide the perfect decoration required to implement such a theme inspired by a show.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Marilyn Monroe Themed Party',
              imageURLs[28],
              'Marilyn Monroe was an American actress, model, and singer.The decoration can be related to here and the guest can dress up inspired by her dressing.This Marilyn Monroe-inspired birthday party was featured on Catch My Party and will have you singing "Happy Birthday, Mr. President!"',
              'People who are really big fan of Marilyn Monroe Would surely like to have a birthday theme inspired by her. Lum events can help with thedecoration and the sings all inspired by her, apart from the catering service and hall booking.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              '"Survivor" Party',
              imageURLs[29],
              'In a survivor birthday party the food Looks great as they are put in wooden plates.The guest can also dress up for it and there are survivor games played in this outdoor party. ',
              'To prepare the food and the plating according to the  theme and planning such games can take up a lot of time and it’s difficult to think of game ideas. Here Lum events can come into picture and help them organize these things.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Kate Spade Themed Party',
              imageURLs[30],
              'The party has the colour black, white, and gold all over.The decoration cake and even the plating has these three colours.A Kate Spade themed birthday party, like this one featured on Shelterness.',
              'Lum events can make the decoration perfectly mathching to the theme , elegant as it should be and provide the best birthday for their clients.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Dinosaur Hunter',
              imageURLs[31],
              'Make your budding paleontologist\'s birthday wishes come true by organizing a dinosaur hunts for him and his friends ! Send kids on a mini excavation in the backyard. Simply fill plastic Easter eggs with small dino toys or wrapped candy, and hide them in a large sand box.',
              'If a kid is obssessed with fossils and Dinosaur this will be a perfect idea . Lum events can stick with dino-themed cake and decorations to keep the excitement going, and let guests take home the unearthed toys and candy party favors.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Paint Night Party',
              imageURLs[32],
              'Paint,wine, friends-What else would you really want, anyway? You can often find these deals in social cafes but this can also be done at home .Give everyone canvas,paints and a photo of what they should re-create or make it a BYOP(Bring Your Own Paint) party',
              'Lum events can make this paint party exciting for adults. It\'s a unique idea and easy to arrange.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Bonfire Party',
              imageURLs[33],
              'Bonfires in your own backyard can make a casual get-together look like a fully planned party without much prep work. Bonfire parties are one of the easiest to throw together',
              'There is nothing like the warmth and fun of sitting around a fire to turn a winter or autumn evening into a memorable night with friends .Lum events can also arrange for a live singe to make the night unforgettable',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Casino Birthday Party',
              imageURLs[34],
              'Having a casino banner and organizing casino games are the main highlights.The decoration can be something related to dice,cards etc.',
              'Getting the perfect venue for a party likes this, oraganizing games and setting up the decoration can be quite a task. Lum events can do this work for their clients.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Paradise India Theme Party',
              imageURLs[35],
              'Having a party inspired by Theme India included bright colors Decoration, showing the greatness of our country like Taj Mhal and having Indian food.',
              'This is an easy to organize party and looks like a really unique theme. Lum events can surely organize this theme party inspired by our country.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Winter Garden Birthday Party',
              imageURLs[36],
              'Perfect theme for a winter Birthday party. You can have an outdoor setting with decoration of snowflakes, birch trees, icy gates, cotton and if you have the budget even a fake snow generator.',
              'Lum events can organize such winter theme parties which are extremely unique.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Hip Hop Birthday Party',
              imageURLs[37],
              'A party inspired by 90\'s hip hop theme with radio , wall painted decoration and 90\'s hip hop songs playing on the speaker',
              'Who doesn \'t love 80\'s and 90\'s hip hop music? I think men are sometimes hard to throw themed parties for,right? Lum events can surely organize a party with these themes. ',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              '80\'s Memphis Inspired Birthday Party',
              imageURLs[38],
              'A party inspired by the 80\'s Memphis design .Memphis design movements were The Max in Saved by the Bell, Pewee\'s Playhouse, and Miami Vice. It\'s all geometrics and loud colors.',
              'This is an extremely unique theme which needs all different kind of decoration ideas to make it perfect. Lum event can think of the new designs for this theme to make it look extraordinary.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Carnival theme party',
              imageURLs[39],
              'Traditional Carnival and Circus decorations such as red and white stripes , popcorn and cotton candy machines and lots and lots of sweet treats .Hire out jugglers ,clowns, acrobats and trapeze artists to really make this a show-stopping event.',
              'A carnival birthday party needs a lot of preparation .And Lum events organize it perfectly and also ad some small fun carnival games in the stalls for the guest.',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Mexican Fiesta Party',
              imageURLs[40],
              'A Fiesta is colorful, bright and fun ! Perfect for the summer weather where you can host outside.Invest in some sombreros, multicolored banners and decorations and of course supply some Mexican food!',
              'Lum events should surely suggest an amazing Fiesta theme birthday party where everyone can even enjoy the Mexican food',
              'Birthday'),
          tiles(
              scaffoldState,
              height,
              width,
              'Game of Thrones Party',
              imageURLs[41],
              'Apart for the guest dressing up like the characters of this amazing show , there can also be Dripping Blood Cake with Iron Throne Topper,Dragon Egg CenterPiece,Custom House Banners ,Middle Aged Feast and Game of Thrones-inspired Food, Game of THrones Pennant Banners ,Medieval Castle Brick Backdrop and much more.',
              ' People are obsessed with the Game of Thrones Series. Having a royal theme party for the fans would be a great idea. Apart from the rest of the things, Lum events can also arrange GOT games like a GOT quiz or treasure hunt.',
              'Birthday')
        ],
      ),
    );
  }
}
