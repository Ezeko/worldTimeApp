import 'package:flutter/material.dart';
import '../services/worldTimeService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time;
  String refresh;

  @override
  void initState() {
    super.initState();
    setUp();
  }

  void setUp() async {
    try {
      var world = WorldTime(
        location: 'Nigeria',
        url: 'Africa/Lagos',
        flag: 'nigeria.jpg',
      );
      await world.getTime();
      setState(() {
        time = world.time;
      });
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': 'Lagos',
        'time': time,
        'flag': 'nigeria.jpg',
        'isDayTime': world.isDayTime,
      });
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Oops!!"),
              content: Text("An error occur"),
              actions: [
                FlatButton(
                  child: Text("Retry"),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => Loading()),
                    );
                    //Navigator.of(context).pop();
                    //print(refresh);
                    /*setState(() {
                      refresh = refresh == null ? 'no' : 'yes';
                    });
                    print(refresh);*/
                  },
                )
              ],
            );
          });
      /*if (Platform.isAndroid) {
        AlertDialog(
          title: Text('Ooops!!'),
        );
      }
      if (Platform.isIOS) {
        CupertinoAlertDialog(
          title: Text('Ooops!'),
          content: Text('An error occur, could not find data'),
        );
      }*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body:
          /*Center(
        child: Image(
          image: AssetImage('images/TickingClock1.gif'),
        ),
      )*/

          SpinKitWanderingCubes(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
