import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:today_weather/pages/weather_info/weather_info.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  int date = 0;
  DateTime _selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              locale: 'ko_KR',
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2021, 07, 01),
              lastDay: DateTime.now().add(const Duration(days: 7)),
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).compareTo(DateTime(selectedDay.year, selectedDay.month, selectedDay.day));
                  if (date > 0) Provider.of<WeatherInfo>(context, listen: false).loadPastWeatherInfo(_selectedDay);
                });
              },
              selectedDayPredicate: (DateTime day) {
                return isSameDay(_selectedDay, day);
              },
              onDisabledDayTapped: (DateTime day) {
                _selectedDay = day;
              },
              headerStyle: const HeaderStyle(
                titleCentered: true,
                titleTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),
                formatButtonVisible: false,
              ),
              calendarStyle: CalendarStyle(
                todayTextStyle: const TextStyle(color: Colors.black),
                todayDecoration : BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF9FA8DA),
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: const TextStyle(color: Colors.red),
                outsideDaysVisible: false
              ),
            ),
            Provider.of<WeatherInfo>(context).weatherStatus(_selectedDay, _selectedDay.day - DateTime.now().day, date)
          ]),
    );
  }
}