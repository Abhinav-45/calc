import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistScreen extends StatelessWidget {
  final SharedPreferences prefs;

  const HistScreen({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1111),
      appBar: AppBar(
        backgroundColor: Color(0xff1a1111),
        title: Center(
          child: Text(
            'History',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: prefs.getKeys().map((key) {
          String calculation = prefs.getString(key)!;
          return ListTile(
            title: Text(
              calculation,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        }).toList(),
      ),
    );
  }
}
