import 'package:flutter/material.dart';
import 'package:today_weather/pages/loading.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Loading(),
      );
  }
}