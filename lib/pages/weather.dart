import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
              lastDay: DateTime.now().add(const Duration(days: 9)),
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                setState(() {
                  date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).compareTo(DateTime(selectedDay.year, selectedDay.month, selectedDay.day));
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
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
            Text(_selectedDay.toString()),
            Text("위치"),
            Text("온도"),
            Text("날씨"),
            Text("바람세기"),
            Text("습도"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("대기질지수"),
                Text("미세먼지"),
                Text("초미세먼지"),
              ],
            )
          ]),
    );
  }
}