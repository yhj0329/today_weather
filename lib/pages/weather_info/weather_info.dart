import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:today_weather/pages/weather_info/network.dart';
import 'package:today_weather/pages/weather_info/location.dart';
import 'package:flutter_svg/svg.dart';

const String apiKey = "V4mGwd%2BcBIUJQM7gOfPAdyB0%2FcYEMS4M4YUvaGpyEMEJsRZGjt5nabizSPvMM%2FuG7%2Bx%2FIMSJEg3BdW53EVbSqg%3D%3D";

class WeatherInfo{
  String today(int day) {
    return DateFormat('yyyyMMdd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + day));
  }
  final String todayTime = DateFormat('HHmm').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour - 1, 0));
  final String todayForPresent = DateFormat('yyyyMMdd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day-1,));
  final String todayForFuture = DateFormat('yyyyMMddHHmm').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().hour < 6 ? DateTime.now().day-1 : DateTime.now().day, DateTime.now().hour > 6 && DateTime.now().hour < 18 ? 6 : 18,));
  var pastWeather;
  var presentWeather;
  var futureWeather;
  var futureWeatherTemperature;

  var pastTemp;
  var pastTempMax;
  var pastTempMin;
  var pastRain;
  var pastWind;
  var pastHumidity;

  var tempMax = [];
  var tempMin = [];
  var rainAM = [];
  var rainPM = [];
  var windAM = [];
  var windPM = [];
  var humidityAM = [];
  var humidityPM = [];
  var forecastAM = [];
  var forecastPM = [];

  double? latitude;
  double? longitude;

  void temp() {
    print(latitude);
  }

  Future<void> loadLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();

    latitude = myLocation.myLatitude;
    longitude = myLocation.myLongitude;
    print(latitude);
    print(longitude);
  }

  Future<void> loadWeatherInfo() async{
    presentWeather = await Network("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=$apiKey&numOfRows=882&pageNo=1&dataType=JSON&base_date=$todayForPresent&base_time=2300&nx=60&ny=127").getJsonData();
    futureWeatherTemperature = await Network("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa?serviceKey=$apiKey&numOfRows=10&pageNo=1&dataType=JSON&regId=11B10101&tmFc=$todayForFuture").getJsonData();
    futureWeather = await Network("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst?serviceKey=$apiKey&numOfRows=10&pageNo=1&dataType=JSON&regId=11B00000&tmFc=$todayForFuture").getJsonData();
    saveWeatherInfo();
  }

  saveWeatherInfo() {
    presentWeather['response']['body']['items']['item'].forEach((item) {
      for (int i = 0; i < 3; i++) {
        if (item.containsValue(today(i))) {
          if (item.containsValue('0600')) {
            if (item['category'] == 'TMN') {
              tempMin.add(item['fcstValue']);
            }
            if (item['category'] == 'POP') {
              rainAM.add(item['fcstValue']);
            }
            if (item['category'] == 'REH') {
              humidityAM.add(item['fcstValue']);
            }
            if (item['category'] == 'WSD') {
              windAM.add(item['fcstValue']);
            }
            if (item['category'] == 'SKY') {
              if (item['fcstValue'] == '1') {
                forecastAM.add('맑음');
              }
              if (item['fcstValue'] == '3') {
                forecastAM.add('구름많음');
              }
              if (item['fcstValue'] == '4') {
                forecastAM.add('흐림');
              }
            }
            if (item['category'] == 'PTY') {
              if (item['fcstValue'] == '1') {
                forecastAM.last += ' 비';
              }
              if (item['fcstValue'] == '2') {
                forecastAM.last += ' 비/눈';
              }
              if (item['fcstValue'] == '3') {
                forecastAM.last += ' 눈';
              }
              if (item['fcstValue'] == '4') {
                forecastAM.last += ' 소나기';
              }
            }
          }
          else if (item.containsValue('1500')) {
            if (item['category'] == 'TMX') {
              tempMax.add(item['fcstValue']);
            }
            if (item['category'] == 'POP') {
              rainPM.add(item['fcstValue']);
            }
            if (item['category'] == 'REH') {
              humidityPM.add(item['fcstValue']);
            }
            if (item['category'] == 'WSD') {
              windPM.add(item['fcstValue']);
            }
            if (item['category'] == 'SKY') {
              if (item['fcstValue'] == '1') {
                forecastPM.add('맑음');
              }
              if (item['fcstValue'] == '3') {
                forecastPM.add('구름많음');
              }
              if (item['fcstValue'] == '4') {
                forecastPM.add('흐림');
              }
            }
            if (item['category'] == 'PTY') {
              if (item['fcstValue'] == '1') {
                forecastPM.last += ' 비';
              }
              if (item['fcstValue'] == '2') {
                forecastPM.last += ' 비/눈';
              }
              if (item['fcstValue'] == '3') {
                forecastPM.last += ' 눈';
              }
              if (item['fcstValue'] == '4') {
                forecastPM.last += ' 소나기';
              }
            }
          }
        }
      }
    });
    for (int i = 3; i < 8; i++) {
      tempMax.add(futureWeatherTemperature['response']['body']['items']['item'][0]['taMax$i']);
      tempMin.add(futureWeatherTemperature['response']['body']['items']['item'][0]['taMin$i']);
      rainAM.add(futureWeather['response']['body']['items']['item'][0]['rnSt${i}Am']);
      rainPM.add(futureWeather['response']['body']['items']['item'][0]['rnSt${i}Pm']);
      forecastAM.add(futureWeather['response']['body']['items']['item'][0]['wf${i}Am']);
      forecastPM.add(futureWeather['response']['body']['items']['item'][0]['wf${i}Pm']);
    }
  }

  Future<void> loadPastWeatherInfo(DateTime day) async {
    String past = DateFormat('yyyyMMdd').format(day);
    pastWeather = await Network("http://apis.data.go.kr/1360000/AsosDalyInfoService/getWthrDataList?serviceKey=$apiKey&numOfRows=10&pageNo=1&dataType=JSON&dataCd=ASOS&dateCd=DAY&startDt=$past&endDt=$past&stnIds=108").getJsonData();
    pastTemp = pastWeather['response']['body']['items']['item'][0]['avgTa'];
    pastTempMax = pastWeather['response']['body']['items']['item'][0]['maxTa'];
    pastTempMin = pastWeather['response']['body']['items']['item'][0]['minTa'];
    pastRain = pastWeather['response']['body']['items']['item'][0]['sumRn'];
    pastWind = pastWeather['response']['body']['items']['item'][0]['avgWs'];
    pastHumidity = pastWeather['response']['body']['items']['item'][0]['avgRhm'];
  }

  Widget weatherStatus(DateTime day, int index, int date) {
    if (date > 0) {
      return SizedBox(
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateFormat.MMMMEEEEd('ko_Kr').format(day), style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue
            ),),
            SizedBox(
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("평균 기온 : $pastTemp°C", style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("최고 기온 : $pastTempMax°C", style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300
                      )),
                      Text("최저 기온 : $pastTempMin°C", style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300
                      ))
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("강수량 : ${pastRain}mm", style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300
                )),
                Text("풍속 : ${pastWind}m/s", style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300
                )),
                Text("습도 : $pastHumidity%", style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300
                )),
              ],
            )],
        ),
      );
    }
    else if (date < 0) {
      return SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateFormat.MMMMEEEEd('ko_Kr').format(day), style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue
            ),),
            SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('오전', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          )),
                          weatherIcon(forecastAM[index]),
                          Text(forecastAM[index], style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ))
                        ],
                      ),
                      Column(
                        children: [
                          const Text('오후', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          )),
                          weatherIcon(forecastPM[index]),
                          Text(forecastPM[index], style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ))
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("최고 기온 : ${tempMax[index]}°C", style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300
                      )),
                      Text("최저 기온 : ${tempMin[index]}°C", style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300
                      ))
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("오전 강수 확률 : ${rainAM[index]}%", style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300
                )),
                Text("오후 강수 확률 : ${rainPM[index]}%", style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300
                ))
              ],
            )],
        ),
      );
    }
    else{
      return SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateFormat.MMMMEEEEd('ko_Kr').format(day), style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue
            ),),
            SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('오전', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          )),
                          weatherIcon(forecastAM[0]),
                          Text(forecastAM[0], style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ))
                        ],
                      ),
                      Column(
                        children: [
                          const Text('오후', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          )),
                          weatherIcon(forecastPM[0]),
                          Text(forecastPM[0], style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ))
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("최고 기온 : ${tempMax[0]}°C", style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300
                      )),
                      Text("최저 기온 : ${tempMin[0]}°C", style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300
                      ))
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("오전 강수 확률 : ${rainAM[0]}%", style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                )),
                Text("오후 강수 확률 : ${rainPM[0]}%", style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("오전 풍속 : ${windAM[0]}m/s", style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                )),
                Text("오후 풍속 : ${windPM[0]}%", style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("오전 습도 : ${humidityAM[0]}m/s", style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                )),
                Text("오후 습도 : ${humidityPM[0]}%", style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                ))
              ],
            )],
        ),
      );
    }
  }

  SvgPicture weatherIcon(String text) {
    if (text == "맑음") {
      return SvgPicture.asset(
        'assets/weather/sunny.svg',
        color: Colors.yellow,
        width: 80,
        height: 80,
      );
    }
    else if (text == "구름많음") {
      return SvgPicture.asset(
        'assets/weather/mostlycloudy.svg',
        width: 80,
        height: 80,
      );
    }
    else if (text == "흐림") {
      return SvgPicture.asset(
        'assets/weather/cloudy.svg',
        width: 80,
        height: 80,
      );
    }
    else if (text.contains("비")) {
      return SvgPicture.asset(
        'assets/weather/rain.svg',
        width: 80,
        height: 80,
      );
    }
    else if (text.contains("눈")) {
      return SvgPicture.asset(
        'assets/weather/snow.svg',
        width: 80,
        height: 80,
      );
    }
    else {
      return SvgPicture.asset(
        'assets/weather/sleet.svg',
        width: 80,
        height: 80,
      );
    }
  }
}