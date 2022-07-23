import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = -35.280781;
  double longitude = 149.131393;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Error getting the location.');
    }
  }
}
