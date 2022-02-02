import 'package:flutter/material.dart';
import 'package:sample_project/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  //const ChooseLocation({ Key? key }) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'london.png', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'london.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'london.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'london.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'london.png', url: 'America/Chicago'),
    WorldTime(
        location: 'New_York', flag: 'london.png', url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'london.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'london.png', url: 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location)));
        },
      ),
    );
  }
}
