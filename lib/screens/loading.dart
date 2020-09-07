import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    void getTime() async {
      Response time =
          await get('http://worldtimeapi.org/api/timezone/Africa/Lagos');
      Map data = jsonDecode(time.body);
      print(data);
    }

    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading page'),
    );
  }
}
