import 'dart:io';
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
  void setUp() async {
    try {
      var world = WorldTime(
        location: 'Nigeria',
        url: 'Africa/Lagos',
        flag: 'nigeria.jpg',
      );
      await world.getTime();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': 'Nigeria',
        'time': world.time,
        'flag': 'nigeria.jpg',
      });
    } catch (e) {
      if (Platform.isAndroid) {
        AlertDialog(
          title: Text('Ooops!!'),
        );
      }
      if (Platform.isIOS) {
        CupertinoAlertDialog(
          title: Text('Ooops!'),
          content: Text('An error occur, could not find data'),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SpinKitWanderingCubes(
        color: Colors.white,
      size: 50.0,
      ),
    );
  }
}
