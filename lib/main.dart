import 'package:flutter/material.dart';
import './screens/loading.dart';
import './screens/chooseLocation.dart';
import './screens/home.dart';
import 'package:load/load.dart';

void main() {
  runApp(LoadingProvider(
      child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/choose': (context) => Location()
      },
    ),
  ));
}

