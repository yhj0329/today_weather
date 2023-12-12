import 'package:intl/intl.dart';
import 'package:today_weather/pages/weather_info/network.dart';
import 'package:today_weather/pages/weather_info/location.dart';

const String apiKey = "V4mGwd%2BcBIUJQM7gOfPAdyB0%2FcYEMS4M4YUvaGpyEMEJsRZGjt5nabizSPvMM%2FuG7%2Bx%2FIMSJEg3BdW53EVbSqg%3D%3D";

class WeatherInfo {
  final String todayForPresent = DateFormat('yyyyMMdd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day-1,));
  final String todayForFuture = DateFormat('yyyyMMddHHmm').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day-1, 6,));
  var presentWeather;
  var futureWeather;
  var futureWeatherTemperature;

  double? latitude;
  double? longitude;

  Future<void> loadLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();

    latitude = myLocation.myLatitude;
    longitude = myLocation.myLongitude;
    print(latitude);
    print(longitude);
  }

  Future<void> loadWeatherInfo() async{
    presentWeather = await Network("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=$apiKey&numOfRows=10&pageNo=1&dataType=JSON&base_date=$todayForPresent&base_time=0500&nx=55&ny=127").getJsonData();
    futureWeather = await Network("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst?serviceKey=$apiKey&numOfRows=10&pageNo=1&dataType=JSON&regId=11B00000&tmFc=$todayForFuture").getJsonData();
    futureWeatherTemperature = await Network("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa?serviceKey=$apiKey&numOfRows=10&pageNo=1&dataType=JSON&regId=11D20501&tmFc=$todayForFuture").getJsonData();
    print(presentWeather);
    print(futureWeather);
    print(futureWeatherTemperature);
  }

  void loadPastWeatherInfo() async {}
}