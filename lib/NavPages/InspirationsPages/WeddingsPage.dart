import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart' as Theme;
import 'Tiles.dart';

class Weddings extends StatefulWidget {
  @override
  _WeddingsState createState() => _WeddingsState();
}

class _WeddingsState extends State<Weddings> {
  List<String> imageURLs = [
    'http://im.rediff.com/movies/2013/dec/13hrithik-sussanne-roshan1.jpg',
    'https://i.pinimg.com/originals/10/86/d8/1086d89ff82d597b945814ea6b58c595.jpg',
    'https://i2-prod.mirror.co.uk/incoming/article18766833.ece/ALTERNATES/s615/0_wedding-MAIN.jpg',
    'https://archive.mid-day.com/photos/plog-content/images/b-town-specials/shaadi-no.-1-the-big-fat-weddings-of-bollywood-stars/akshay-twinkle.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTtxWTrM-y5D4VkNeeevrHhY335gXMk0YCrMg&usqp=CAU',
    'https://1.bp.blogspot.com/-X0v_Lc2mX48/Tc2IjzaXaVI/AAAAAAAAAWM/8sBWlSeb13Q/s1600/Farah+Khan+%2526+Shirish+Kunder+Marriage+Ever+Seen+3.jpg',
    'https://st1.photogallery.ind.sh/wp-content/uploads/indiacom/karisma-kapoor-married-sunjay-kapoor-in-2003-201703-1489737366.jpg',
    'https://celebritynews.pk/wp-content/uploads/2019/10/Aamir-Khan-wedding-photos-6.jpg',
    'https://www.cheatsheet.com/wp-content/uploads/2018/04/Melania-Trump-walking-down-the-aisle-with-Donald-Trump.png',
    'https://i.pinimg.com/originals/c1/44/2a/c1442afb556ebc8147388605e86ddebc.jpg',
    'https://media.weddingz.in/images/2937cdee5d8d6c5f2d958dacdd202658/the-yuvraj-hazel-wedding-affair-all-you-want-to-know.jpg',
    'https://static.topyaps.com/wp-content/uploads/2018/05/son.png',
    'https://images.indianexpress.com/2018/11/deepika-ranveer-new-1.jpg',
    'https://media.weddingz.in/images/291c7117558af75d73bb6f6785c047ca/priyanka-chopra-and-nick-jonass-wedding-date-and-venue-are-out-and-i-cant-keep-calm.jpg',
    'https://cdn.images.express.co.uk/img/dynamic/106/750x445/931966.jpg',
    'https://media.architecturaldigest.in/wp-content/uploads/2017/12/Virushka-Wedding-Decor-866x487.jpg',
    'https://images.news18.com/ibnlive/uploads/2019/12/Manish-Pandey-Ashrita-Shettys-Wedding-Pictures-8.jpg?impolicy=website&width=400&height=0',
    'https://i.pinimg.com/originals/6d/43/01/6d4301f342637b296f017a07a96e7365.jpg',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F67.jpg?alt=media&token=f185f186-2a9e-4eaf-bbb3-699cbb128856',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F68.jpg?alt=media&token=bc2c2484-c01a-4656-943e-d750394f4435',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F69.jpg?alt=media&token=a8e74395-b568-4086-83e0-d646e2079160',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F70.jpg?alt=media&token=1a0b946b-ed42-4d3c-9298-b93681ae5dbc',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F71.jpg?alt=media&token=8731b6cb-dc69-485c-a741-8c2ebae67038',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F72.jpg?alt=media&token=7b3f92af-ddb9-49f8-a1af-48a9a85f68b9',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F73.jpg?alt=media&token=07b619b8-8ae4-4be6-8121-df1307790235',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F74.jpeg?alt=media&token=d24718ca-093c-432b-a508-071c2e23a5c1',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F75.jpg?alt=media&token=7cdb45f2-e685-4187-90ed-a1ddffd62e5b',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F76.jpg?alt=media&token=d78bf079-50f8-4eef-a076-46d9ec499a9b',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F77.jpg?alt=media&token=343e291d-4037-45ee-92d3-369905ef53ff',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F78.jpg?alt=media&token=c0d9300c-95cb-451b-a69a-5251154c32cd',
    'https://firebasestorage.googleapis.com/v0/b/lumevents-48ff2.appspot.com/o/Weddings%2F79.jpg?alt=media&token=c97a0938-9385-4a05-af88-6708c39065d3',
  ];
  double height, width;

  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print(imageURLs.length.toString());
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
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
      key: scaffoldState,
      body: ListView(
        children: [
          tiles(
              scaffoldState,
              height,
              width,
              'Sonam Kapoor and Anand Ahuja',
              imageURLs[11],
              'Sonam Kapoor was the prettiest bride ever who deserved the best things on her big day, which includes a perfect wedding venue. The couple exchanged their vows not at a lavish five-star hotel but at the beautiful home of Sonam’s aunt in Bandra, Mumbai. The house hosted the biggest names in Bollywood and was decked up in beautiful blue and white upholstery in the garden area for the traditional Sikh wedding, Anand Karaj. The wedding festivities will end with a party in the evening at a five-star hotel in Mumbai. The wedding invite, instead of an ostentatious invitation card, was a beautifully designed e-card that said, “Your presence on our special day is the only gift we desire.” There was also Customized kalirey with a peacock by Mrinalini Chandra.Groom also wore sneakers',
              'Sonam Kapoor’s wedding was of one of the most popular weddings of Bollywood. Though the wedding was held in a garden of Sonam’s aunt the wedding venue was perfect with on point decoration. Lum events can not only take inspiration from the beautiful wedding dress but also the lavish decoration. And with the upcoming E-generation, their reception e-card is also something they can take inspiration from. Also, the mint colour saree was something never seen before but really admired.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Ranveer Singh and Deepika Padukone',
              imageURLs[12],
              'Everything about this wedding was magical. Right from the beautiful lake side venue to all the gorgeous dresses to the beautiful decoration everything was perfect. We might have seen couples matching clothes but this is the first time we saw even the families matching clothes with the couple.',
              'The personal hand-written note for the engagement seems is something new. Lum events can also implement some ideas from this wedding for their future weddings.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Priyanka Chopra Jonas and Nick Jonas',
              imageURLs[13],
              'Nickyanka, as they are now called, sealed the deal with multi-cultural functions across Jodhpur, Mumbai and Delhi—packed with celebrity guests, multiple outfit changes, a palace venue and everything else you can possibly think of—a 75-foot wedding veil included. With details such as these, it came as no surprise that Priyanka Chopra Jonas and Nick Jonas\' nuptials made for one of the Googled weddings of the year. A vibrant mehandi function at Jodhpur\'s Umaid Bhawan Palace began the festivities, followed by a fun-filled sangeet that also included performances by Chopra Jonas\' cousin Parineeti Chopra, Jonas\' brothers Joe and Kevin, as well as Joe\'s fiancé, Sophie Turner. ',
              'Everything about this wedding was Perfect .The tradition wedding in Jodhpur to a wedding in Greece. But the thing which was most spoken about was the beautiful customized one in a million wedding dress.It not only had one of the longest Veil but also had the Eight different phrases with importance to the bride were hand- stitched onto the dress.Lum events can also use this idea for weddings of their clients in future.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Prince Harry and Meghan Markle',
              imageURLs[14],
              'As everyone says their wedding was a fairytale wedding with the custom diamond engagement ring Prince Harry used to propose. Harry designed the piece, which was then made by court jewelers Cleave and Company using one diamond sourced from Botswana and two smaller stones from Princess Diana\'s collection.',
              'Who doesn’t want a perfect castle wedding? Lum events can give them the dream wedding they desire. Wouldn’t it be a great idea to feature a wedding live on youtube especially during this lockdown? Instead of the tradition old way of newly wed going home in a car, Lum events can give ideas of a carriage procession at the end of the wedding.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Virat Kohli and Anushka Sharma',
              imageURLs[15],
              'Anushka’s embroidered soft pink, Sabyasachi lehenga, during the wedding came together in a coherent, seamless aesthetic. Anushka Sharma’s bridal march to the mandap from the villa lasted less than a minute and the path was lined with pastel flowers. The decor was done by Devika Narain of Devika Narain and Company. White candles placed within glass lanterns that hung from the ceiling, providing a romantic and charming backdrop to the wedding proceedings.Spontaneous bhangra beats and sounds of Indian dhol livened up the rather quiet village in Italy.',
              'Virushka’s wedding was the popular of all times. Venue of the wedding, is in itself a great attraction to all the people around the globe. Wedding dress, all the decorations was perfect. Dhol in their wedding gave a traditional touch in the wedding ceremony.LumEventscan take ideas from it and can implement them in their future weddings.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Manish Pandey and Ashritha Shetty',
              imageURLs[16],
              'For mehendi function, Ashrita wore a heavily embroidered Kalki fashion yellow lehnga, keeping it all simple. And for the big day she picked a maroon and gold silk saree ,whereas Manish opted for cream coloured Sherwani.',
              ' lumevents are events professional with creative ideas and solutions which will turn your wedding to a wow memory.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Neeti Mohan and Nihar Pandya',
              imageURLs[17],
              'Decked up in a cream, pastel green and pink lehenga paired with traditional kundan jewellery, Neeti captioned the pictures, “Love and Gratitude.” Nihar, too, complemented his bride in a cream and pink sherwani and a pink turban. On February 14, they had a Mehendi ceremony .It showed the couple posing amid hundreds of bulbs giving the impression of star. Earlier the bride had held pre- wedding photo -shoot with her sisters,which had the girl posing and having fun.',
              'lumevents are events professional with creative ideas and solutions which will turn your wedding to a wow memory.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Troian Bellisario	and	Patrick	J.Adams wedding',
              imageURLs[19],
              'Suits star Patrick J. Adams married his  longtime  girlfriend  and Pretty   Little Liars co-star, TroianBellisario, in a beautiful California wedding. The couple said "I do" in a stunning outdoor ceremony, with trees and candles as aisle décor. The weekend, which the couple dubbed "Fort Day," included glamorous camping, or "glamping." Guests all boarded a converted school bus that read "almost married" and stayed in tents during the weekend.',
              'The wedding was allegedly inspired by nature. Having 3 days wedding and staying in tents is a very unique idea. Organizing such event will help lumevents gain popularity.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Prince Harry and Meghan Markle Wedding',
              imageURLs[21],
              'As everyone says their wedding was a fairytale wedding with the custom diamond engagement ring Prince Harry used to propose. Harry designed the piece, which was then made by court jewelers Cleave and Company using one diamond sourced from Botswana and two smaller stones from Princess Diana collection. Harry and Meghan wedding was televised and live streamed around the world. The formal wedding invitations were mailed out in late March.Immediately following the exchange of vows, Prince Harry and Meghan Markle took a carriage ride through Windsor. The route went go along High Street through town before returning back via the Long Walk. Like many details of Harry and Meghan royal wedding, the bouquet included a personal touch. The all white arrangement featured flowers picked by Prince Harry himself before the wedding. Blooms in the bouquet included Forget-Me-Nots, which were Princess Diana favorite flower, sweet peas, lily of the valley, astilbe, jasmine and astrantia. Like all royal wedding bouquets, it included a sprig of myrtle, which dates back to the wedding of Queen Victoria daughter, Princess Victoria. Myrtle symbolizes hope and love, making it a fitting addition to any bride bouquet, royal or not. ',
              "Who doesn’t want a perfect castle wedding? Lum events can give them the dream wedding they desire. Wouldn’t it be a great idea to feature a wedding live on youtube especially during this lockdown? Instead of the tradition old way of newly wed going home in a car, Lum events can give ideas of a carriage procession at the end of the wedding.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Neeti Mohan and Nihar Pandya.",
              imageURLs[25],
              "On February 14, they had a Mehendi ceremony .It showed the couple posing amid hundreds of bulbs giving the impression of stars. Earlier the bride had held pre- wedding photo -shoot with her sisters,which had the girl posing and having fun. ",
              "lumevents are events professional with creative ideas and solutions which will turn your wedding to a wow memory.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Prateik Babbar and Sanya",
              imageURLs[26],
              "A reception was also hosted in Lucknow and Sanya looked pretty in  a cream and brown-coloured lehenga, while Prateik went with a green bandhgala suit and white churidhar. The ceremony was attended by their families, and the pictures from the couple’s wedding have been shared on social media. Prateik and Sanya were married		in	a	Marathi-style	Hindu ceremony and Sanya was draped in an orange sari. Prateik was wearing a cream	coloured		sherwani	for		the occasion. ",
              "lumevents are events professional with creative ideas and solutions which will turn your wedding to a wow memory.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Bipasha Basu & Karan Singh Grover",
              imageURLs[27],
              "the country’s tallest hotel st. regis mumbai, located in mumbai’s premier entertainment and commercial district of lower parel. bipasha donn ed a red and gold  sabyasachi mukherjee lehenga saree for her bengali-punjabi-mix wedding at st. regis mumbai. she accesorized with a heavy mathapatti by kishandas jewellery and the traditional mukut and bengali bridal makeup. karan complimented bipasha in a pearl white sherwani by shyamli arora. karan added a fun element to his monkey wedding by entering the venue on a segway. ",
              "the wedding venue is the one of the important factor of the wedding. Her wedding was held on tallest hotel in a very traditional way. The tadka of bengali-punjabi mix wedding was a remarkable in their wedding. Their weding was not so serious type but more of joyous and happily wedding ever. They enjoyed every moment whether it is ceremonies or parties . Organizing such events makes the guests and organizers feels happy and satisfied by seeing the happiness of bride and groom.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Hailey Baldwin and Justin Bieber",
              imageURLs[28],
              "Hailey Baldwin and the Biebs got hitched. The pair said ‘I do’ in front of guests like Kendall and Kylie Jenner, at the Montage Palmetto Bluff hotel in south Carolina. The off-the-shoulder lace gown was designed by Virgil Abloh for Off-White.",
              "their wedding was a private but joyous one. A perfect gown and the function being held on one of the famous hotel is another thing. Organizing such events make the customers happy and are spoken about even after ages. It will not only increase customer satisfaction but also the company’s goodwill",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Idris Elba And Sabrina Dhowre",
              imageURLs[29],
              "three-day celebration in Marrakesh. The couple exchanged vows at the ksar char bagh hotel in front of family and friends. While the bride wore two custom dresses, both by vera wang, with david morris jewellery. Elba chose a bespoke suit by ozwald boateng with asprey black and white diamond cufflinks.",
              "a simple and classy wedding like Idris and Sabrina make a beautiful marriage that everyone will remember. It was a 3 day celebration wedding this type of wedding makes the moments to be cherished in a lifetime because mainly, every wedding lasts for 1 day which makes less enjoyment but by doing this kind of wedding makes each and every moment special for the bride and groom.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Ellie Goulding and Caspar Jopling",
              imageURLs[30],
              "Ellie Goulding married art dealer Caspar Jopling at a lavish ceremony at York Minster. Wearing a custom- made Chloé gown featuring a high-neck, which took a reported 640 hours to make, Goulding arrived in a blue Volkswagen camper van to the cheers  of  the  waiting crowds lining the streets. High society and the A-list turned out in their dozens to celebrate the happy occasion - unsurprising considering how well- connected the bride and groom are",
              "a lavish and a vintage styled wedding is a great ideas for all the upcoming brides. Having a perfect self customized gown and a church wedding is a perfect ideas for a wedding. Organizing such events will help the organizers gain popularity.",
              'Wedding'),
        ],
      ),
    );
  }
}
