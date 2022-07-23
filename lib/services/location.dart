import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 21.815689;
  double longitude = 87.082390;

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
