import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data;
  String bgImage;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDayTime'] ? 'morning.jpeg' : 'night.jpeg';
    Color bgColor = data['isDayTime'] ? Colors.grey : Colors.grey[900];
    Color textColor = data['isDayTime'] ? Colors.black : Colors.blueGrey[50];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150.0, 0, 0),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 8.0),
                  RaisedButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/choose');
                      setState(() {
                        data = result;
                      });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Choose location'),
                  ),
                  SizedBox(height: 8.0),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/${data['flag']}'),
                    radius: 28.0,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: textColor,
                        ),
                      ),
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 38.0,
                          color: textColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
