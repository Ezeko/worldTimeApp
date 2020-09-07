import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Home screen'),
              SizedBox(height: 8.0),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/choose');
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
