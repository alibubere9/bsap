import 'package:classified_app/injection.dart';
import 'package:classified_app/services/interfaces/i_location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

void openMap(double? lat, double? lng) async {
  Position currentPosition = await sl<ILocationService>().getLocation();
  String _url =
      'https://www.google.com/maps/dir/?api=1&origin=${currentPosition.latitude},${currentPosition.longitude}&destination=$lat,$lng';
  await launch(_url);
}
