import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ChooseLocation  extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation > {
  bool _loading = false;

  int counter = 0;

  List<WorldTime> locations = [
    WorldTime(location: 'Dhaka', flag: 'bangladesh.png', url: 'Asia/Dhaka'),
    WorldTime(location: 'Almaty', flag: 'bangladesh.png', url: 'Asia/Almaty'),
    WorldTime(location: 'Amman', flag: 'bangladesh.png', url: 'Asia/Amman'),
    WorldTime(location: 'Karachi', flag: 'bangladesh.png', url: 'Asia/Karachi'),
    WorldTime(location: 'Jakarta', flag: 'bangladesh.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Kathmandu', flag: 'bangladesh.png', url: 'Asia/Kathmandu'),
    WorldTime(location: 'Qatar', flag: 'bangladesh.png', url: 'Asia/Qatar'),
    WorldTime(location: 'Riyadh', flag: 'bangladesh.png', url: 'Asia/Riyadh'),
    WorldTime(location: 'Shanghai', flag: 'bangladesh.png', url: 'Asia/Shanghai'),
    WorldTime(location: 'Singapore', flag: 'bangladesh.png', url: 'Asia/Singapore'),
    WorldTime(location: 'Tehran', flag: 'bangladesh.png', url: 'Asia/Tehran')
  ];

  void updateTime(index) async {

    setState(() {
      _loading = true;
    });

    WorldTime instance = locations[index];
    await instance.getTime();

    setState(() {
      _loading = false;
    });

    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: false,
        elevation: 0,
      ),
      body: ModalProgressHUD(
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                ),
              ),
            );
          },
        ),
        inAsyncCall: _loading,
      ),
    );
  }

}
