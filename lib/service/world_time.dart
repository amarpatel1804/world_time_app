import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  late String location;// loaction name
  late String time;//time in that location
  late String flag;//flag icon
  late String url;//location url for api end point
  late bool isDayTime;//true or false if daytime

  WorldTime({this.location='',this.flag='',this.url=''});



  Future<void> getData() async {
    try{
    http.Response response =
    await http.get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));

    Map<String,dynamic> data=jsonDecode(response.body);

    //Get Properties from data
    var datetime=data['dateTime'];
    var day=data['dayOfWeek'];
    //print(data);
    // print(datetime);
    //print(day);

    DateTime now =DateTime.parse(datetime);
   // print(now);

    isDayTime=now.hour>6 && now.hour<20?true:false;
    time=DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught error $e');
      time='could not get time';
    }
  }





}