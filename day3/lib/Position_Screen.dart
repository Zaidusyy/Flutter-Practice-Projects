
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Position_Screen extends StatefulWidget {
  const Position_Screen({super.key});

  @override
  State<Position_Screen> createState() => _Position_ScreenState();
}

class _Position_ScreenState extends State<Position_Screen> {

  Position? position;

  fetchPosition()async{
    bool serviceEnabled;
    LocationPermission locationPermission;

    serviceEnabled=await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      print("Location Service is Disabled");
    }
    locationPermission=await Geolocator.checkPermission();
    if(locationPermission==LocationPermission.denied){
      locationPermission=await Geolocator.requestPermission();
      if(locationPermission==LocationPermission.denied){
        print("Permission Denied");
      }
    }
    if(locationPermission==LocationPermission.deniedForever){
      print("denied Foever");
    }
    Position currentposition=await Geolocator.getCurrentPosition();
    print(currentposition);
    setState(() {
      position=currentposition;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Container(
            height: 500,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Text(position==null?"Position is Null":"${position.toString()}")),
          ),
          ElevatedButton(onPressed: (){
            fetchPosition();
          }, child: Text("Click to pick")),
          ElevatedButton(onPressed: ()async{

            LocationAccuracyStatus status= await Geolocator.getLocationAccuracy();

            print(status.toString());


          }, child: Text("Click to Multiple pick")),
        ],
      ),
    );
  }
}



