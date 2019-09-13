import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './pages/about.dart';
import './pages/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gen Pin',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Generate PIN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _pins = [" ", " ", " ", " ", " ", " "];

  void _generatePins() {
    final _random = new Random();
    setState(() {
      _pins = [
        for (var _ in [1, 2, 3, 4, 5, 6])
          _random.nextInt(1000000).toString().padLeft(6, '0'),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
            tooltip: 'About',
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            tooltip: 'Settings',
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          for (var pin in _pins)
            Expanded(child: FittedBox(child: Text(pin))),
            Spacer()
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generatePins,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
