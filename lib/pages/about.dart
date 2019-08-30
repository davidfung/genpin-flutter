import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const ABOUT_URL = 'https://amg99.com';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
        children: <Widget>[
          Text('WHY', style: TextStyle(fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(top: 7),
          ),
          Text(
              'If you frequently need to generate pin numbers for various types of reason, this app can help you.'),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Text('GEN PIN', style: TextStyle(fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(top: 7),
          ),
          Text(
              'It generates pin numbers for you instead of you think of some "not-so-random" random pin numbers.'),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Text('WARNING', style: TextStyle(fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(top: 7),
          ),
          Text(
              'These pin numbers are not secure enough to be used as passwords.'),
          Padding(
            padding: EdgeInsets.only(top: 40),
          ),
          InkWell(
              onTap: () {
                _launchURL();
              },
              child: Text('amg99.com',
                  style: TextStyle(fontStyle: FontStyle.italic))),
        ],
      ),
    );
  }

  void _launchURL() async {
    const url = ABOUT_URL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
