import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String url;
  String time;
  String flag;
  WorldTime({this.location, this.url, this.flag});

  Future <void> getTime() async {
      Response response =
      await get('http://worldtimeapi.org/api/timezone/Africa/Lagos');
      Map data = jsonDecode(response.body);
      DateTime now = DateTime.parse(data['utc_datetime']);
      String offset = (data['utc_offset']).substring(1, 3);

      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      print(data['utc_datetime']);
      print(time);
      

      //Platform.isAndroid ? print('Android') : print('ios');
    
  }
}
