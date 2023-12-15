import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_weather/pages/weather_info/weather_info.dart';

class Food extends StatelessWidget {
  const Food({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('오늘의 추천 메뉴!!', style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w600
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('오늘의 날씨 : ', style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Provider.of<WeatherInfo>(context).weatherIcon(Provider.of<WeatherInfo>(context).forecastPM[0]),
                    Text(Provider.of<WeatherInfo>(context).forecastPM[0], style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ))
                  ],
                )
              ],
            )
          ],
        ),
        foodRecommend(Provider.of<WeatherInfo>(context).forecastPM[0])
      ],
    );
  }

  Widget foodRecommend(String text) {
    if (text == "맑음") {
      return SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/food/chicken.jpeg"),
                Text("치킨", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
            Row(
              children: [
                Image.asset("assets/food/pig_foot.jpeg"),
                Text("족발", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
          ],
        ),
      );
    }
    else if (text == "구름많음") {
      return SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/food/kalguksu.jpeg"),
                Text("칼국수", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
            Row(
              children: [
                Image.asset("assets/food/kimchi_stew.jpeg"),
                Text("김치찌개", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
          ],
        ),
      );
    }
    else if (text == "흐림") {
      return SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/food/pork_belly.jpeg"),
                Text("삼겹살", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
            Row(
              children: [
                Image.asset("assets/food/samgyetang.jpeg"),
                Text("삼계탕", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
          ],
        ),
      );
    }
    else if (text.contains("비")) {
      return SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/food/kimchi_pancake.jpeg"),
                Text("김치전", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
            Row(
              children: [
                Image.asset("assets/food/potato_pancake.jpeg"),
                Text("감자전", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
          ],
        ),
      );
    }
    else if (text.contains("눈")) {
      return SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/food/fish_paste_soup.jpeg"),
                Text("오뎅탕", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
            Row(
              children: [
                Image.asset("assets/food/braised_spicy_chicken.jpeg"),
                Text("닭볶음탕", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
          ],
        ),
      );
    }
    else {
      return SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/food/ramen.jpeg"),
                Text("라면", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
            Row(
              children: [
                Image.asset("assets/food/tteokbokki.jpeg"),
                Text("떡볶이", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
          ],
        ),
      );
    }
  }
}