import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';
class chooselocation extends StatefulWidget {
  const chooselocation({super.key});

  @override
  State<chooselocation> createState() => _chooselocationState();
}

class _chooselocationState extends State<chooselocation> {

  List<WorldTime> locations=[
    WorldTime(url:'Europe/London', location:'London',flag: 'uk.png'),
    WorldTime(url:'Asia/Dubai', location:'Cairo',flag: 'Dubai.png'),
    WorldTime(url:'America/Chicago', location:'Chicago',flag: 'america.png'),
    WorldTime(url:'Asia/Seoul', location:'Seoul',flag: 'seoul.png'),
    WorldTime(url:'Africa/Nairobi', location:'Nairobi',flag: 'Nairobi.png'),
    WorldTime(url:'America/Barbados', location:'Barbados',flag: 'Barbados.png'),
    WorldTime(url:'Asia/Kolkata', location:'Kolkata',flag: 'Kolkata.png'),
    WorldTime(url:'Australia/Sydney', location:'Sydney',flag: 'Sydney.png'),
    WorldTime(url:'Canada/Yukon', location:'Yukon',flag: 'Canada.png'),
    WorldTime(url:'Pacific/Wake', location:'Wake',flag: 'Pacific.png'),

    //WorldTime(url:'America/Chicago', location:'Chicago',flag: 'afgani.png'),

  ];
  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getData();
    Navigator.pop(context,{
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Choose a Location',
          style: TextStyle(
            color:Colors.white,
        ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blue[800],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                 updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}

