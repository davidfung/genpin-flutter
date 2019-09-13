import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const int DEFAULT_PIN_LENGTH = 6;

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _pinLength;

  @override
  void initState() {
    _loadSettings().then((pinLength) {
      setState(() {
        _pinLength = pinLength;
      });
    });
    super.initState();
  }

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
                _saveSettings();
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
                });
                _saveSettings();
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
                });
                _saveSettings();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<int> _loadSettings() async {
    int _pinLength;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      _pinLength = prefs.getInt('pinLength');
    } catch (e) {
      _pinLength = DEFAULT_PIN_LENGTH;
    }
    if (_pinLength == null){
      _pinLength = DEFAULT_PIN_LENGTH;
    }
    print("_loadSettings() $_pinLength");
    return _pinLength;
  }

  void _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('pinLength', _pinLength);
    print("_saveSettings() $_pinLength");
  }
}
