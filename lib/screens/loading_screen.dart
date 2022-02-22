import 'package:flutter/material.dart';
import 'package:clima1_oop2/services/location.dart';
import 'package:http/http.dart';

const apiKey =
    'https://api.openweathermap.org/data/2.5/weather?lat=37.42342342342342&lon=122.08395287867832&appid=8137ace68448d41da44e9bf9fd681a85';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.long);
    print(location.lat);
  }

  void getData() async {
    Response response = await get(Uri.parse(apiKey));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
