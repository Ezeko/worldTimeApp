import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:worldTime/services/worldTimeService.dart';
import '../services/worldTimeService.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  var loading = false;
  var loader;
  List<WorldTime> locations = [
    WorldTime(location: 'Abijan', url: 'Africa/Abidjan', flag: 'abijan.png'),
    WorldTime(location: 'Algiers', url: 'Africa/Algiers', flag: 'algeria.png'),
    WorldTime(location: 'Dubai', url: 'Asia/Dubai', flag: 'dubai.png'),
    WorldTime(location: 'Berlin', url: 'Europe/Berlin', flag: 'germany.jpg'),
    WorldTime(location: 'Cairo', url: 'Africa/Cairo', flag: 'egypt.png'),
    WorldTime(location: 'Seoul', url: 'Asia/Seoul', flag: 'china.jpg'),
    WorldTime(location: 'Jamaica', url: 'America/Jamaica', flag: 'jamaica.png'),
    WorldTime(location: 'London', url: 'Europe/London', flag: 'gbp.jpg'),
    WorldTime(location: 'Lagos', url: 'Africa/Lagos', flag: 'nigeria.jpg'),
    WorldTime(
        location: 'Mexico', url: 'America/Mexico_City', flag: 'mexico.png'),
    WorldTime(location: 'New York', url: 'America/New_York', flag: 'usa.jpg'),
    WorldTime(
        location: 'Los Angeles', url: 'America/Los_Angeles', flag: 'usa.jpg'),
    WorldTime(
        location: 'Winnipeg', url: 'America/Winnipeg', flag: 'canada.png'),
  ];
  getTimeHere(index) async {
    await locations[index].getTime();
    //print(locations[index].flag);
    setState(() {
      loading = false;
    });
    
    loader.dismiss();
    //navigate back to home screen
    Navigator.pop(context, {
      'location': locations[index].location,
      'time': locations[index].time,
      'flag': locations[index].flag,
      'isDayTime': locations[index].isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Choose Location'),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 0),
              child: Card(
                child: ListTile(
                  onTap: () async {
                    setState(() {
                      loading = true;
                    });

                    if (loading) {
                      var dialog = await showLoadingDialog();
                      setState(() {
                        loader = dialog;
                      });
                    
                    }

                    getTimeHere(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('images/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
