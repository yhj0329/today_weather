import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MyLocation {
  late double myLatitude;
  late double myLongitude;

  Future<void> getMyCurrentLocation() async {

    var statusLocation = await Permission.location.request();

    if (statusLocation.isGranted)
    {

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      myLatitude = position.latitude;
      myLongitude = position.longitude;

    }
    else
    {
      print("위치 권한이 필요합니다.");
    }
  }


}