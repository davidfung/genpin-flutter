import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:genpin/utility/utility.dart';

import './pages/about.dart';
import './pages/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gen Pin',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
  List<String> _pins;

  void _generatePins() {
    final random = new Random();
    int ceiling;

    loadIntSettings(setting_pinLength, defaultValue: DEFAULT_PIN_LENGTH)
        .then((pinLength) {
      ceiling = int.parse("1".padRight(pinLength + 1, '0'));
      setState(() {
        _pins = [
          for (var _ in [1, 2, 3, 4, 5, 6])
            random.nextInt(ceiling).toString().padLeft(pinLength, '0'),
        ];
      });
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
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _generatePins,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    Widget w;
    if (_pins == null) {
      w = Container();
    } else {
      w = Column(
        children: <Widget>[
          for (var pin in _pins) Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FittedBox(child: Text(pin)),
          )),
          if (MediaQuery.of(context).orientation == Orientation.portrait)
            Spacer()
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      );
    }
    return w;
  }
}
