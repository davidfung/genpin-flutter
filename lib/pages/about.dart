import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical:30.0, horizontal:30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('WHY', style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(top: 7),),
            Text('If you frequently need to generate pin numbers for various types of reason, this app can help you.'),
            Padding(padding: EdgeInsets.only(top: 30),),
            Text('Gen Pin', style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(top: 7),),
            Text('It generates pin numbers for you instead of you think of some "not-so-random" random pin numbers.'),
            Padding(padding: EdgeInsets.only(top: 30),),
            Text('Warning', style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(top: 7),),
            Text('These pin numbers are not secure enough to use as passwords.'),
            Spacer(),
            Text('amg99.com', style: TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
