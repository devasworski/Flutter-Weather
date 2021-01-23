import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();

  LocationScreen(this.LocationWeather);
  final LocationWeather;
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel model = WeatherModel();
  var city = "";
  double temp = 0;
  var condition = 805;
  String message = "Data could not be fetched";

  @override
  void initState() {
    updateUI(widget.LocationWeather);
    super.initState();
  }

  void updateUI(dynamic WeatherJson) {
    if (WeatherJson == null) {
      return;
    }
    city = WeatherJson['name'];
    temp = WeatherJson['main']['temp'] - 275.15;
    condition = WeatherJson['weather'][0]['id'];
    message = "${model.getMessage(temp.toInt())}! \n\n $city";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await model.getLocationWeather();
                      updateUI(weatherData);
                      print("updated weather");
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "${temp.toStringAsFixed(1)}°C  ",
                      style: kTempTextStyle,
                    ),
                    Text(
                      model.getWeatherIcon(condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  message,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
