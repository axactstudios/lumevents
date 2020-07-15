import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lumevents/IdeaPageTabViews/RealEvents/Tiles.dart';

import '../../theme.dart' as Theme;

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
    'https://i.pinimg.com/originals/6d/43/01/6d4301f342637b296f017a07a96e7365.jpg'
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
              'Hrithik Roshan & Sussanne',
              imageURLs[0],
              'Hrithik Roshan tied the knot with Sussanne Khan in a special ceremony held at Sussanne’s father. Sanjay Khan’s luxury spa, Golden Palms, near Bangalore. The pool in Golden Palms has something like an island at its centre. There’s a bridge extending from there to the edge of the pool. The bridge acted as the aisle,the island was the alter.The Hindu boy married themuslim girl in a Christian wedding.',
              'The entire idea of creating a Mandap in the middle of the pool became very famous and a lot of magazines spoke about this amazing pool-island wedding. Having an event with such an appealing Mandap can not only make the couple’s special day unique but also will make Lumevents gain more popularity.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Catherine Zeta-Jones & Michael Douglas',
              imageURLs[1],
              'Catherine Zeta-Jones & Michael Douglas‘s Wedding was “a twelve hour fantastic party at The Plaza in New York” as said by Catherine in her recent Instagram post.As one might expect from two seriously famous Hollywood performers, security was apparently incredibly strict at the wedding, with the BBC reporting that "guests had to show their hologrammed invitations before being allowed in and private photographs were banned. She looked beautiful in her White gown and the pictures just went viral after 20 years. ',
              'Weddings are all about making the couples day Joyous. And having a perfect gown and the function being held in one of the richest hotels gets brownie points in that matter. Organizing such marriages which make the customers happy and are spoken about even after years will not only increase the company’s goodwill but alsoit’s customers satisfaction.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Brad Pitt and Jennifer Aniston',
              imageURLs[2],
              'The couple were surrounded by 50,000 flowers by exclusive Beverly Hills florist La Premiere, who laid tables with roses, wisteria and tulips to achieve the \'zen garden\' look.In a bid to ensure maximum privacy, airspace above the estate was restricted during the ceremony and the reception was held under the cover of a giant white marquee to stop thecircling helicopters getting a photo.',
              'When a person wants to do somethingunusual on their birthdays they hire planners to organize it. Having such distinct theme parties with something new such as their picture t-shirts,personalized Cutlery and smartly placed picture clicking spots Can make an event go very popular. This can increase the company’s popularity as well.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Akshay Kumar and Twinkle Khanna',
              imageURLs[3],
              'Akshay Kumar and Twinkle Khanna tied the knot in a hush hush ceremony in Mumbai.',
              'from their wedding we get inspiration that everyplace can make memorable even in “terrace”.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Jon Stewart and Tracey McShane',
              imageURLs[4],
              'Jon Stewart proposed to his wife Tracey McShane in a unique way: through a personalized crossword puzzle put together with the help of Will Shortz, a New York Times crossword editor. The unique proposal made their marriage even more special.',
              'By doing functions such as the proposal before the actual wedding can make the couple’s wedding extraordinary. And will also increase the word of mouth publicity of the company.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Farah Khan and Shirish Kunder',
              imageURLs[5],
              'it’s easy to forget the fact that theirs is an interfaith coupling and that Shirish is eight years younger than his wife. Neither of these facts seem to have affected the wonderful couple or their relationship, and we must say that we don’t think we’ll concern ourselves too much with those details either, apart from mentioning that it’s nice to see some “unconventional” couples in the limelight happily married.',
              'farah khan ans shirish\' s wedding set an example that age doesn’t matter in love',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Karishma Kapoor And Sunjay Kapoor',
              imageURLs[6],
              'Karisma’s wedding was kept as low profile as possible, but when a Kapoor is getting married that’s next to impossible. The house inside was decorated with flowers. The garden that surrounded the house had been turned into a Sheesh Mahal that could accommodate 600 guests.',
              'Karishma’s pink lehemga and her beautiful diamond sandals were spoken about many magazines. Even a simple wedding in RK Cottage was made so special. By organising such events lumevents could get alot of public attention which would mke their brand popular.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Aamir Khan',
              imageURLs[7],
              'In 2002, Aamir Khan got divorced with mutual consent with Reena Dutta and in 2005 he married a Brahmin girl Kiran Rao. This inter- religious marriage, set an example to the young couples as they announced the birth of their son Azad in 2011.',
              'Aamir Khan’s marriage with Kiran Rao, proves that true love don’t limit on religious backgrounds and rich or poor.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Donald Trump',
              imageURLs[8],
              'Real-estate mogul Donald Trump tied the knot with his girlfriend, model Melania Knauss, in a lavish celebration on 22nd January 2005. Former New York City mayor Rudy Giuliani, and television personalities Star Jones, Barbara Walters, Regis Philbin and Kelly Ripa, then celebrated with an extravagant reception inside a 17,000-sq.-ft. ballroom built at Mar-a-Lago, Trump’s Palm Beach, Fla resort. Guests dined on steamed shrimp salad, beef tenderloin, caviar, lobster rolls, Grand Marnier chocolate truffle cake and Cristal champagne.',
              'Trump’s marriage was organized at Trump’s Palm Beach, which marked the extravagant marriage of its time, with one of the royal parties in America.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Robert Downey Jr.',
              imageURLs[9],
              'When Robert Downey Jr. and Susan Downey first met in the early 2000s, the actor was given his third shot at love. After Robert asked her out for a third time, she said yes, and it wasn\'t long before these lovebirds were on the same page. They both married on 27th August at Windy Dune Estate in Amagansett, New York.',
              ' Robert Downey Jr.’s wedding marked a beautiful night of all times at Windy Dune Estate. Lovely couple dance on the stage, and their love story is one of Hollywood\'s longest-lasting power couples. Such events help in the growth of the company, and will be remembered last long.',
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              'Yuvraj and Hazel',
              imageURLs[10],
              'The couples were married in a traditional Sikh ceremony at a dera in the Fatehgarh Sahib Gurudwara in Chandigarh. Hazel is a Hindu of Mauritian ethnicity and the couple wanted a Hindu ceremony by the beach. They organized a second wedding at the Teso Waterfront in Siolim, Goa.',
              'Yuvraj and Hazel pulled off two wedding ceremonies. This idea is great for the couples from different cultures or religion. Apart from spectacular, it also adds up to the ease and convenience which otherwise gets chaotic in a one-day celebration.',
              'Wedding'),
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
        ],
      ),
    );
  }
}
