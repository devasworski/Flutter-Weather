import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/config.dart'; // API FIlE in .gitignore

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location loc;

  Future<void> getLocation() async {
    loc = Location();
    loc.getCurrentLocation();
  }

  void getData() async {
    await getLocation();
    http.Response response = await http.get(
        "https://samples.openweathermap.org/data/2.5/weather?lat=${loc.getLat()}&lon=${loc.getLong()}&appid=${OPENWEATHERMAP_API_KEY}");
    if (response.statusCode == 200)
      print(response.body);
    else
      print(response.statusCode);
  }

  @override
  void initState() {
    print("init");
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(child: Text(loc.toString())),
    );
  }
}
