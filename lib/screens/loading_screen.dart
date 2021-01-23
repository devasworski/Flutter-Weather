import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import '../services/networking.dart';
import 'package:clima/services/config.dart'; // API FIlE in .gitignore

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location loc;
  var WeatherJson;

  Future<void> getLocationData() async {
    loc = Location();
    loc.getCurrentLocation();
    APIHelper api = APIHelper(
        "https://samples.openweathermap.org/data/2.5/weather?lat=${loc.getLat()}&lon=${loc.getLong()}&appid=${OPENWEATHERMAP_API_KEY}");
    WeatherJson = await api.getData();
    var city = WeatherJson['name'];
    var temp = WeatherJson['main']['temp'];
    var description = WeatherJson['weather'][0]['description'];
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(loc.toString())),
    );
  }
}
