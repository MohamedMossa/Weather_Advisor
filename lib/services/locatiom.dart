import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

   getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          print("GPS Location service is granted");
        }
      } else {
        print("GPS Location permission granted000.");
      }
    } catch (e) {
      print(e);
    }
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        longitude = position.longitude;
        latitude = position.latitude;
      } catch (e) {
        print(e);
      }
    }
  }

