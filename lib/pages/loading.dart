import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:world_time/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

  void setupWorldTime() async{
    WorldTime instance=WorldTime(location: 'London',flag: 'uk.png',url: 'Europe/London');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDayTime,

    });
    // print(instance.time);
    // setState(() {
    //   time=instance.time;
    // });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
