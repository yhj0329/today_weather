import 'package:flutter/material.dart';
import 'package:today_weather/pages/today_weather.dart';
import 'package:today_weather/pages/weather_info/weather_info.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState(){
    super.initState();
    getInfo();
  }

  void getInfo () async{
    WeatherInfo info = WeatherInfo();
    await info.loadLocation();
    await info.loadWeatherInfo();
    await info.loadPastWeatherInfo(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day-2));

    if(!mounted) return;
    Navigator.push(context,
        MaterialPageRoute(builder:
            (context) => MaterialApp(
          home: Provider(
          create: (context) => info,
          child: TodayWeather()))));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue,
          size: 80.0,
        ),
      ),
    );
  }
}