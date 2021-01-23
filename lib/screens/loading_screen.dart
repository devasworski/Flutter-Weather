import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location loc;

  void getLocation() {
    loc = Location();
    loc.getCurrentLocation();
  }

  @override
  void initState() {
    print("init");
    getLocation();
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
