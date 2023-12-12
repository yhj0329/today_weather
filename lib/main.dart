import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_weather/pages/loading.dart';
import 'package:today_weather/pages/today_weather.dart';
import 'package:today_weather/pages/weather_info/weather_info.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider(
        create: (context) => WeatherInfo(),
        child: Loading(),
      )
    );
  }
}