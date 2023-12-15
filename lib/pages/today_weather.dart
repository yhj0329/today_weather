import 'package:flutter/material.dart';
import 'package:today_weather/pages/weather.dart';
import 'package:today_weather/pages/clothes.dart';
import 'package:today_weather/pages/food.dart';

class TodayWeather extends StatefulWidget {
  const TodayWeather({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodayWeatherState();
}

class _TodayWeatherState extends State<TodayWeather>
{
  int _bottomItemIndex = 2;

  final List<Widget> _pages = [
    Weather(),
    Clothes(),
    Food(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Today Weather',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
            elevation: 0,
            centerTitle: false,
            titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600
            ),
            title: const Text("Today Weather")),
          body: _pages[_bottomItemIndex],
          bottomNavigationBar: Container(
            height: 110,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomNavigationBar(
              items: const[
                BottomNavigationBarItem(
                  icon: Icon(Icons.cloud),
                  label: '날씨',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wc),
                  label: '옷 추천',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.food_bank_outlined),
                  label: '음식 추천',
                ),
              ],
              currentIndex: _bottomItemIndex,
              selectedFontSize: 16,
              selectedItemColor: Colors.blue,
              onTap: (int index) {
                setState(() {
                  _bottomItemIndex = index;
                });
              },
            ),
          ),
        ));
  }
}
