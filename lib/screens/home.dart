import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150.0, 0, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 8.0),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/choose');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Choose location'),
                ),

                SizedBox(height: 8.0),
                Column(
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                      ),
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 38.0,
                      ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
