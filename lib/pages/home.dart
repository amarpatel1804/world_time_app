import 'package:flutter/material.dart';
import 'package:world_time/pages/loading.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic,dynamic> data={};
  @override
  Widget build(BuildContext context) {

    final settings = ModalRoute.of(context)?.settings;
     data = settings?.arguments as Map<dynamic, dynamic>;

    //var bgImage = (data['isDayTime'] ?? false) ? 'day.png' : 'night.png';


    String bgImage = (data['isDaytime']) ? 'assets/day.png' : 'assets/night.png';

    Color bgColor = (data['isDaytime']) ? Color(0xFF2596BE) : Colors.indigo;



    return Scaffold(
     backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          //height: 50.0,
          //width: 50.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$bgImage'),

              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: SafeArea(
              child: Column(
                children: [
                  ElevatedButton.icon(
                  onPressed: () async{
                    dynamic result=await Navigator.pushNamed(context, '/location');
                    setState(() {
                      // print(result);
                      data['time']=result['time'];
                      data['location']=result['location'];
                      data['isDaytime']=result['isDaytime'];
                      data['flag']=result['flag'];

                      // data={
                      //   'time':result['time'],
                      //   'location':result['location'],
                      //   'isDaytime':result['isDaytime'],
                      //   'flag':result['flag']
                      //
                      // };
                    });
                  },
                label: Text("EDIT LOCATON",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              icon: Icon(
                Icons.edit_location,
                color: Colors.blue,
              ),
            ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0
                          ),
                      )
                    ],
                  ),
                    SizedBox(height: 20.0),
                  Text(
                    data['time'],
            style: TextStyle(
                fontSize: 60.0,
            ),

                  ),
                ],

              ),

            ),
          ),
        ),
      ),
    );
  }
}
