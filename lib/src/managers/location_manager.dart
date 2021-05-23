import 'package:injectable/injectable.dart';
import 'package:project/src/app/locator.dart';
import 'package:project/src/models/location_model.dart';
import 'package:project/src/services/local_data_service.dart';
import 'package:project/src/services/location_service.dart';

@lazySingleton
class LocationManager {
  final LocationService _locationService = locator<LocationService>();
  final LocalData _localData = locator<LocalData>();

  Future<void> saveCurrentLocation() async {
    var result = await isLocationEnabled();
    if (result) {
      var location = await _locationService.getCurrentLocation();
      var locationModel = LocationModel(
          latitude: location.latitude, longitude: location.longitude);
      await _localData.create(
        'location',
        locationModel.toJson(),
      );
    } else {
      await _locationService.getLocationPermission();
      var location = await _locationService.getCurrentLocation();
      var locationModel = LocationModel(
          latitude: location.latitude, longitude: location.longitude);
      await _localData.create(
        'location',
        locationModel.toJson(),
      );
    }
  }

  Future<LocationModel> getCurrentLocation() async {
    var result = await isLocationEnabled();
    if (result) {
      var location = await _locationService.getCurrentLocation();
      var locationModel = LocationModel(
          latitude: location.latitude, longitude: location.longitude);
      return locationModel;
    } else {
      await _locationService.getLocationPermission();
      var location = await _locationService.getCurrentLocation();
      var locationModel = LocationModel(
          latitude: location.latitude, longitude: location.longitude);
      return locationModel;
    }
  }

  Future<bool> isLocationEnabled() async {
    return await _locationService.isLocationPermissionEnabled();
  }
}
