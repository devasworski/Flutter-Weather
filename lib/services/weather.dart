import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import '../services/networking.dart';
import 'package:clima/services/config.dart';

class WeatherModel {
  Location loc;
  var weatherJson;

  Future<dynamic> getLocationWeather() async {
    loc = Location();
    await loc.getCurrentLocation();
    APIHelper api = APIHelper(
        "https://samples.openweathermap.org/data/2.5/weather?lat=${loc.getLat()}&lon=${loc.getLong()}&appid=${OPENWEATHERMAP_API_KEY}");
    return await api.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
