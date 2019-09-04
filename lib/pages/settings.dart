import 'package:flutter/material.dart';

const int DEFAULT_PIN_LENGTH = 6;

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _pinLength = DEFAULT_PIN_LENGTH;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ListTile(
              title: const Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text('Pin Length',
                      style: TextStyle(
                        fontSize: 24.0,
                      )))),
          ListTile(
            title: const Text('4 digits'),
            leading: Radio(
              value: 4,
              groupValue: _pinLength,
              onChanged: (int value) {
                setState(() {
                  _pinLength = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('6 digits'),
            leading: Radio(
              value: 6,
              groupValue: _pinLength,
              onChanged: (int value) {
                setState(() {
                  _pinLength = value;
                  print(_pinLength);
                });
              },
            ),
          ),
          ListTile(
            title: const Text('8 digits'),
            leading: Radio(
              value: 8,
              groupValue: _pinLength,
              onChanged: (int value) {
                setState(() {
                  _pinLength = value;
                  print(_pinLength);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
