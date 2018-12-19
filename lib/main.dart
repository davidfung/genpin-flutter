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
      _pin1 = _random.nextInt(1000000).toString().padLeft(6,'0');
      _pin2 = _random.nextInt(1000000).toString().padLeft(6,'0');
      _pin3 = _random.nextInt(1000000).toString().padLeft(6,'0');
      _pin4 = _random.nextInt(1000000).toString().padLeft(6,'0');
      _pin5 = _random.nextInt(1000000).toString().padLeft(6,'0');
      _pin6 = _random.nextInt(1000000).toString().padLeft(6,'0');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Text('$_pin1', style: Theme.of(context).textTheme.display3)),
            Expanded(child: Text('$_pin2', style: Theme.of(context).textTheme.display3)),
            Expanded(child: Text('$_pin3', style: Theme.of(context).textTheme.display3)),
            Expanded(child: Text('$_pin4', style: Theme.of(context).textTheme.display3)),
            Expanded(child: Text('$_pin5', style: Theme.of(context).textTheme.display3)),
            Expanded(child: Text('$_pin6', style: Theme.of(context).textTheme.display3)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generatePins,
        tooltip: 'Generate Pins',
        child: Icon(Icons.apps),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
