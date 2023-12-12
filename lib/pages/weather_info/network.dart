import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MyLocation {
  late double myLatitude;
  late double myLongitude;

  Future<void> getMyCurrentLocation() async {

    // 위치권한을 가지고 있는지 확인
    var statusLocation = await Permission.location.status;

    if (statusLocation.isGranted) {
      // 1-2. 권한이 있는 경우 위치정보를 받아와서 변수에 저장합니다.
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      myLatitude = position.latitude;
      myLongitude = position.longitude;

    } else {
      print("위치 권한이 필요합니다.");
    }
  }

}