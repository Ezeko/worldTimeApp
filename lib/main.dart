import 'dart:js';

import 'package:flutter/material.dart';
import './screens/loading.dart';
import './screens/chooseLocation.dart';
import './screens/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/choose': (context) => Location()
    },
  ));
}

