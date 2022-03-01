import 'dart:convert';
import 'package:clima1_oop2/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima1_oop2/services/location.dart';
import 'package:clima1_oop2/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '8137ace68448d41da44e9bf9fd681a85';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? longitude;
  double? latitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.long;
    latitude = location.lat;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
    print(weatherData.runtimeType);
    print(location.long);
    print(location.lat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child:
          SpinKitFadingCircle(itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.red : Colors.green,
          ),
        );
      }),
    ));
  }
}
