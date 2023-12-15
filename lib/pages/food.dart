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
        height: 430,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 400,
              height: 200,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/chicken.jpeg", width: 200, height: 150,),
                  const Text("치킨", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/pig_foot.jpeg", width: 200, height: 150,),
                  const Text("족발", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
          ],
        ),
      );
    }
    else if (text == "구름많음") {
      return SizedBox(
        height: 430,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 400,
              height: 200,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/kalguksu.jpeg", width: 200, height: 150,),
                  const Text("칼국수", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/kimchi_stew.jpeg", width: 200, height: 150,),
                  const Text("김치찌개", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
          ],
        ),
      );
    }
    else if (text == "흐림") {
      return SizedBox(
        height: 430,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 400,
              height: 200,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/pork_belly.jpeg", width: 200, height: 150,),
                  const Text("삼겹살", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/samgyetang.jpeg", width: 200, height: 150,),
                  const Text("삼계탕", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
          ],
        ),
      );
    }
    else if (text.contains("비")) {
      return SizedBox(
        height: 430,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 400,
              height: 200,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/kimchi_pancake.jpeg", width: 200, height: 150,),
                  const Text("김치전", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/potato_pancake.jpeg", width: 200, height: 150,),
                  const Text("감자전", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
          ],
        ),
      );
    }
    else if (text.contains("눈")) {
      return SizedBox(
        height: 430,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 400,
              height: 200,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/fish_paste_soup.jpeg", width: 200, height: 150,),
                  const Text("오뎅탕", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/braised_spicy_chicken.jpeg", width: 200, height: 150,),
                  const Text("닭볶음탕", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
          ],
        ),
      );
    }
    else {
      return SizedBox(
        height: 430,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 400,
              height: 200,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/ramen.jpeg", width: 200, height: 150,),
                  const Text("라면", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/food/tteokbokki.jpeg", width: 200, height: 150,),
                  const Text("떡볶이", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}