import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocationService {
  Future<bool> isLocationServiceEnabled() async =>
      await Geolocator.isLocationServiceEnabled();

  Future<bool> isLocationPermissionEnabled() async {
    var _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied)
      return false;
    else if (_permission == LocationPermission.deniedForever)
      return false;
    else
      return true;
  }

  Future<void> getLocationPermission() async {
    try {
      await Geolocator.requestPermission();
    } catch (e) {
      rethrow;
    }
  }

  Future<Position> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
          timeLimit: const Duration(seconds: 15));
    } catch (e) {
      rethrow;
    }
  }
}
