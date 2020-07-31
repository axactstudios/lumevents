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
    'https://i.pinimg.com/originals/6d/43/01/6d4301f342637b296f017a07a96e7365.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/67.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/68.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/69.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/70.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/71.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/72.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/73.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/74.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/75.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/76.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/77.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/78.jpg'
    'gs://lumevents-48ff2.appspot.com/Weddings/79.jpg'
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
              'Adrienne Bailon and Israel Houghton wedding',
              imageURLs[20],
              'AdrienneBailon to say "I do" with the most glamorous Parisian wedding you ever did see. She married her love, Israel , and their ballroom affair captured by Mon Conte de fees was one for the books. From the Eiffel Tower backdrop to her curve- hugging Walter mendez dress.',
              'Paris is the most romantic city of the world and getting married there is a dream of many. So organizing this kind of destination wedding will make the day memorable for the couple.',
              'Wedding'),


          tiles(
              scaffoldState,
              height,
              width,
              'Katie Maloney and Tom Schwartz wedding',
              imageURLs[21],
              'The couple exchanged vows in front of nearly 100 guests Wednesday evening in an elegant, rustic wedding at the Twenty Mile House in Northern California. The bride and groom were wed underneath a ceremony arch of white drapery, with white flower petals at their feet and towering trees enveloping their ceremony space.',
              'Weddings are all about making the couples day Joyous. And having a perfect destination and wonderful decoration of flowers matter. Organizing such marriages which make the customers happy and are spoken about even after years will not only increase the company’s goodwill but also its customer’s satisfaction.',
              'Wedding'),


          tiles(
              scaffoldState,
              height,
              width,
              'Prince Harry and Meghan Markle Wedding',
              imageURLs[22],
              'As everyone says their wedding was a fairytale wedding with the custom diamond engagement ring Prince Harry used to propose. Harry designed the piece, which was then made by court jewelers Cleave and Company using one diamond sourced from Botswana and two smaller stones from Princess Diana collection. Harry and Meghan wedding was televised and live streamed around the world. The formal wedding invitations were mailed out in late March.Immediately following the exchange of vows, Prince Harry and Meghan Markle took a carriage ride through Windsor. The route went go along High Street through town before returning back via the Long Walk. Like many details of Harry and Meghan royal wedding, the bouquet included a personal touch. The all white arrangement featured flowers picked by Prince Harry himself before the wedding. Blooms in the bouquet included Forget-Me-Nots, which were Princess Diana favorite flower, sweet peas, lily of the valley, astilbe, jasmine and astrantia. Like all royal wedding bouquets, it included a sprig of myrtle, which dates back to the wedding of Queen Victoria daughter, Princess Victoria. Myrtle symbolizes hope and love, making it a fitting addition to any bride bouquet, royal or not. ',
              "Who doesn’t want a perfect castle wedding? Lum events can give them the dream wedding they desire. Wouldn’t it be a great idea to feature a wedding live on youtube especially during this lockdown? Instead of the tradition old way of newly wed going home in a car, Lum events can give ideas of a carriage procession at the end of the wedding.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Pippa Middleton’s Wedding ",
              imageURLs[23],
              "Miss Middleton, 33, who is the younger sister of the duchess, married 41-year-old Mr Matthews at St Mark's Church in Englefield, Berkshire.The bride received a rousing cheer from around 100 royal fans and residents as she arrived.Guests filed out and walked to nearby Englefield House, where it is believed a champagne reception is being held.Miss Middleton wore a bespoke Giles Deacon dress. The dress was teamed with a Stephen Jones veil, a Maidenhair Fern tiara, and Manolo Blahnik ivory satin shoes. Pippa Middleton was driven to St Mark's Church alongside her father in a 1951 Jaguar.A group of local well-wishers were allowed to come close to the church and were able to see all the guests arrive - including tennis star, Roger Federer.Miss Middleton's diamond engagement ring is reported to have cost £250,000. The camera crews are from everywhere. ",
              "Gorgeous wedding dress, diamond ring in the engagement, captures the attention of all the guests and cameramen, which were invited in their royal wedding. Pippa Middleton’s entry in the venue, along with her father, in a car makes the day memorable to the bride and all the guests. LumEvents can take ideas from the royal wedding of Pippa and James, can use cameramen and other telecasting techniques to make the event more memorable. LumEvents cam implement other ideas in their upcoming events.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Kavita Kaushik weds Ronnit Biswas ",
              imageURLs[24],
              "Kavita Kaushik had a low-key wedding with Ronnit Biswas in Kedarnath, Uttarakhand. The wedding was an intimate affair with total of 15 guests gracing the occasion, including Kavita's close friend actress AashkaGoradia andBrent Goble.Kavita chose Himalayas as her wedding destination because both she and Ronnit are very fond of Shiva. Kavita’s love for mountains was also the reason, they decided to marry in Kedarnath. ",
              "Wedding destination are nowadays one of the major concerns in today’s weddings. Kavita and Ronnit wedding in Kedarnath, depicts their love towards mountains and faith in Lord Shiva. Selecting a beautiful venue, according to the interest of the couples can be done by LumEvents. In their wedding, local people, were also invited, which made their wedding more amazing. LumEvents can take ideas from their weddings.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Kate Upton and Justin Verlander's Wedding ",
              imageURLs[25],
              "The couple’s invitation suite, designed by Wiley Valentine, set the tone for their romantic, formal wedding—and even featured an illustration of the Tuscan countryside on the envelope liner. For the dinner that night, everyone traded their Under Armour team jerseys for something red—with Justin in a crimson tuxedo jacket and Kate in a scarlet Valentino gown. That dress was the first of two Valentinos she wore. Kate’s sisters wore silk gowns by Christy Rilling Studio while her other ‘maids looked pretty in pink beaded dresses by Needle & Thread. Her flower girl also sported a pink dress—along with a cardigan and flower crown.Guest were, of course, outfitted in custom attire. Kate made her grand entrance through a flower-covered gate before walking down an aisle covered in even more flowers.The couple exchanged vows overlooking the property’s gardens—in fact, they were the first couple to say “I do” in this location!! Tuscany Flowers created a statement display for the escort card table, incorporating pink dahlias, roses, olive branches, and berry accents ",
              "LumEvents can organize a particular dress code for all the guests in their wedding. Beautiful flowers were in itself looks pretty and adorable. Kate arranged for a grand gesture of celebration: a firework display that lit up the Tuscan sky as they cut their cake. Such ideas in the upcoming weddings help LumEvents to organize the event in a much better way and in its own uniqueness.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Neeti Mohan and Nihar Pandya.",
              imageURLs[26],
              "On February 14, they had a Mehendi ceremony .It showed the couple posing amid hundreds of bulbs giving the impression of stars. Earlier the bride had held pre- wedding photo -shoot with her sisters,which had the girl posing and having fun. ",
              "lumevents are events professional with creative ideas and solutions which will turn your wedding to a wow memory.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Prateik Babbar and Sanya",
              imageURLs[27],
              "A reception was also hosted in Lucknow and Sanya looked pretty in  a cream and brown-coloured lehenga, while Prateik went with a green bandhgala suit and white churidhar. The ceremony was attended by their families, and the pictures from the couple’s wedding have been shared on social media. Prateik and Sanya were married		in	a	Marathi-style	Hindu ceremony and Sanya was draped in an orange sari. Prateik was wearing a cream	coloured		sherwani	for		the occasion. ",
              "lumevents are events professional with creative ideas and solutions which will turn your wedding to a wow memory.",
              'Wedding'),

          tiles(
              scaffoldState,
              height,
              width,
              "Bipasha Basu & Karan Singh Grover",
              imageURLs[28],
              "the country’s tallest hotel st. regis mumbai, located in mumbai’s premier entertainment and commercial district of lower parel. bipasha donn ed a red and gold  sabyasachi mukherjee lehenga saree for her bengali-punjabi-mix wedding at st. regis mumbai. she accesorized with a heavy mathapatti by kishandas jewellery and the traditional mukut and bengali bridal makeup. karan complimented bipasha in a pearl white sherwani by shyamli arora. karan added a fun element to his monkey wedding by entering the venue on a segway. ",
              "the wedding venue is the one of the important factor of the wedding. Her wedding was held on tallest hotel in a very traditional way. The tadka of bengali-punjabi mix wedding was a remarkable in their wedding. Their weding was not so serious type but more of joyous and happily wedding ever. They enjoyed every moment whether it is ceremonies or parties . Organizing such events makes the guests and organizers feels happy and satisfied by seeing the happiness of bride and groom.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Hailey Baldwin and Justin Bieber",
              imageURLs[29],
              "Hailey Baldwin and the Biebs got hitched. The pair said ‘I do’ in front of guests like Kendall and Kylie Jenner, at the Montage Palmetto Bluff hotel in south Carolina. The off-the-shoulder lace gown was designed by Virgil Abloh for Off-White.",
              "their wedding was a private but joyous one. A perfect gown and the function being held on one of the famous hotel is another thing. Organizing such events make the customers happy and are spoken about even after ages. It will not only increase customer satisfaction but also the company’s goodwill",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Idris Elba And Sabrina Dhowre",
              imageURLs[30],
              "three-day celebration in Marrakesh. The couple exchanged vows at the ksar char bagh hotel in front of family and friends. While the bride wore two custom dresses, both by vera wang, with david morris jewellery. Elba chose a bespoke suit by ozwald boateng with asprey black and white diamond cufflinks.",
              "a simple and classy wedding like Idris and Sabrina make a beautiful marriage that everyone will remember. It was a 3 day celebration wedding this type of wedding makes the moments to be cherished in a lifetime because mainly, every wedding lasts for 1 day which makes less enjoyment but by doing this kind of wedding makes each and every moment special for the bride and groom.",
              'Wedding'),
          tiles(
              scaffoldState,
              height,
              width,
              "Ellie Goulding and Caspar Jopling",
              imageURLs[31],
              "Ellie Goulding married art dealer Caspar Jopling at a lavish ceremony at York Minster. Wearing a custom- made Chloé gown featuring a high-neck, which took a reported 640 hours to make, Goulding arrived in a blue Volkswagen camper van to the cheers  of  the  waiting crowds lining the streets. High society and the A-list turned out in their dozens to celebrate the happy occasion - unsurprising considering how well- connected the bride and groom are",
              "a lavish and a vintage styled wedding is a great ideas for all the upcoming brides. Having a perfect self customized gown and a church wedding is a perfect ideas for a wedding. Organizing such events will help the organizers gain popularity.",
              'Wedding'),




        ],
      ),
    );
  }
}
