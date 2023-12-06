import 'package:flutter/material.dart';
import 'package:today_weather/pages/weather.dart';
import 'package:today_weather/pages/clothes.dart';
import 'package:today_weather/pages/food.dart';

class TodayWeather extends StatefulWidget {
  const TodayWeather({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SuitMeState();
}

class _SuitMeState extends State<TodayWeather>
{
  int _bottomItemIndex = 0;
  bool _appbarSettingsIcon = false;

  final List<Widget> _pages = [
    Weahter(),
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
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.cloud),
                label: 'Weather',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wc),
                label: 'Clothes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.food_bank_outlined),
                label: 'Food',
              ),
            ],
            currentIndex: _bottomItemIndex,
            selectedItemColor: Colors.lightGreen,
            onTap: (int index) {
              setState(() {
                _bottomItemIndex = index;
              });
            },
          ),
        )
    );
  }
}
