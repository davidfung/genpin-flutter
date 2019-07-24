import 'dart:math';
import 'package:flutter/material.dart';

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
  String _pin1 = '';
  String _pin2 = '';
  String _pin3 = '';
  String _pin4 = '';
  String _pin5 = '';
  String _pin6 = '';

  void _generatePins() {
    final _random = new Random();
    setState(() {
      _pin1 = _random.nextInt(1000000).toString().padLeft(6, '0');
      _pin2 = _random.nextInt(1000000).toString().padLeft(6, '0');
      _pin3 = _random.nextInt(1000000).toString().padLeft(6, '0');
      _pin4 = _random.nextInt(1000000).toString().padLeft(6, '0');
      _pin5 = _random.nextInt(1000000).toString().padLeft(6, '0');
      _pin6 = _random.nextInt(1000000).toString().padLeft(6, '0');
    });
  }

  Widget buildPinWidget(String pin) {
    return Center(
        child: Text(
      pin,
      style: Theme.of(context).textTheme.display1,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: buildPinWidget(_pin1)),
          Expanded(child: buildPinWidget(_pin2)),
          Expanded(child: buildPinWidget(_pin3)),
          Expanded(child: buildPinWidget(_pin4)),
          Expanded(child: buildPinWidget(_pin5)),
          Expanded(child: buildPinWidget(_pin6)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generatePins,
        tooltip: 'Increment',
        child: Icon(Icons.apps),
      ),
    );
  }
}
