import 'package:flutter/material.dart';
import 'package:worldTime/services/worldTimeService.dart';
import '../services/worldTimeService.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', url: 'Europe/Berlin', flag: 'germany.jpg'),
    WorldTime(location: 'China', url: 'Asia/china', flag: 'china.jpg'),
    WorldTime(location: 'London', url: 'Europe/London', flag: 'gbp.jpg'),
    WorldTime(location: 'Lagos', url: 'Africa/Lagos', flag: 'nigeria.jpg'),
    WorldTime(location: 'Texas', url: 'America/Texas', flag: 'usa.jpg'),
  ];
  getTimeHere(index) async {
    await locations[index].getTime();
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
            return Card(
              child: ListTile(
                onTap: () {
                  getTimeHere(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('images/${locations[index].flag}'),
                ),
              ),
            );
          }),
    );
  }
}
