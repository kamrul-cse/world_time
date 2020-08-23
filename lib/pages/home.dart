import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

    // set background
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpeg';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text('Edit Location',
                          style: TextStyle(
                            color: Colors.grey[300]
                          ),
                      ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
