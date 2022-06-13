import 'package:classified_app/services/interfaces/i_location_service.dart';
import 'package:geolocator/geolocator.dart';

class LocationService implements ILocationService {
  Future<Position> getLocation() async {
    LocationPermission permission = await _checkLocationPerzmission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return Geolocator.getCurrentPosition();
    }
    return getLocation();
  }

  _checkLocationPerzmission() async {
    LocationPermission permission = await _getLocationAccess();

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      print(Future.error(
          'Location permissions are permantly denied, we cannot request permissions.'));

      Geolocator.openAppSettings();
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        print(Future.error(
            'Location permissions are denied (actual value: $permission).'));
        Geolocator.openAppSettings();
      }
    }
    return permission;
  }

  Future<LocationPermission> _getLocationAccess() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print(Future.error('Location services are disabled.'));
      return await Geolocator.requestPermission();
    } else {
      return LocationPermission.denied;
      // _checkLocationPermission();
      // return _getLocationAccess();
    }
  }
}
