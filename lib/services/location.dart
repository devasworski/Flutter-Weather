import 'package:geolocator/geolocator.dart';

class Location {
  double _long;
  double _lat;

  void getCurrentLocation() async {
    try {
      Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      _lat = pos.latitude;
      _long = pos.longitude;
    } catch (e) {
      print(e);
    }
  }

  double getLat() {
    return _lat;
  }

  double getLong() {
    return _long;
  }

  String toString() {
    return "Long: $_long, Lat: $_lat";
  }
}
