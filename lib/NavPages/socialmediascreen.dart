import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:mailer2/mailer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart' as Theme;

class SocialMediaScreen extends StatefulWidget {
  @override
  _SocialMediaScreenState createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Theme.MyColors.themeColor),
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
                'Contact Us',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      FlutterOpenWhatsapp.sendSingleMessage('+918967695914',
                          'Hi! I use your supercool app DreamThyEve!');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/whatsapp.png',
                              height: pHeight * 0.1,
                            ),
                            SizedBox(
                              height: pHeight * 0.02,
                            ),
                            Container(
                              width: pWidth * 0.35,
                              child: Center(
                                child: Text(
                                  'WhatsApp',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.75),
                                      fontFamily: 'nunito',
                                      fontSize: pHeight * 0.025,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: pWidth * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL(
                          'https://instagram.com/dreamthyeve?igshid=1jb2dhqnt1qc9');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/instagram.png',
                              height: pHeight * 0.1,
                            ),
                            SizedBox(
                              height: pHeight * 0.02,
                            ),
                            Container(
                              width: pWidth * 0.35,
                              child: Text(
                                'Instagram',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75),
                                    fontFamily: 'nunito',
                                    fontSize: pHeight * 0.025,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: pHeight * 0.03,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _launchURL(
                          'https://www.facebook.com/Dreamthyeve-101778754964097/');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/facebook(1).png',
                              height: pHeight * 0.1,
                            ),
                            SizedBox(
                              height: pHeight * 0.02,
                            ),
                            Container(
                              width: pWidth * 0.35,
                              child: Center(
                                  child: Text(
                                'Facebook',
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75),
                                    fontFamily: 'nunito',
                                    fontSize: pHeight * 0.025,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: pWidth * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL('https://twitter.com/DreamTheEve1?s=09');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/twitter.png',
                              height: pHeight * 0.1,
                            ),
                            SizedBox(
                              height: pHeight * 0.02,
                            ),
                            Container(
                              width: pWidth * 0.35,
                              child: Center(
                                  child: Text(
                                'Twitter',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75),
                                    fontFamily: 'nunito',
                                    fontSize: pHeight * 0.025,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
