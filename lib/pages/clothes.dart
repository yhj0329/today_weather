import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_weather/pages/weather_info/weather_info.dart';

class Clothes extends StatelessWidget {
  const Clothes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('오늘의 의상 추천!!', style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w600
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('오늘 기온 : ', style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                )),
                Text('${Provider.of<WeatherInfo>(context).tempMin[0]}°C ~ ${Provider.of<WeatherInfo>(context).tempMax[0]}°C', style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ))
              ],
            )
          ],
        ),
        foodRecommend(double.parse(Provider.of<WeatherInfo>(context).tempMin[0]))
      ],
    );
  }

  Widget foodRecommend(double tempurture) {
    if (tempurture < 0) {
      return SizedBox(
        height: 470,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300,
              height: 150,
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
                  Image.asset("assets/clothes/padding.png", width: 140, height: 140,),
                  const Text("패딩", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  Image.asset("assets/clothes/long_shirt.png", width: 140, height: 140,),
                  const Text("긴팔", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  Image.asset("assets/clothes/long_pants.png", width: 140, height: 140,),
                  const Text("긴바지", style: TextStyle(
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
    else if (tempurture >= 0 && tempurture < 10) {
      return SizedBox(
        height: 470,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300,
              height: 150,
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
                  Image.asset("assets/clothes/jamper.jpg", width: 140, height: 140,),
                  const Text("얇은 점퍼", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  Image.asset("assets/clothes/long_shirt.png", width: 140, height: 140,),
                  const Text("긴팔", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  Image.asset("assets/clothes/long_pants.png", width: 140, height: 140,),
                  const Text("긴바지", style: TextStyle(
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
    else if (tempurture >= 10 && tempurture < 20) {
      return SizedBox(
        height: 470,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300,
              height: 150,
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
                  Image.asset("assets/clothes/gadigan.png", width: 140, height: 140,),
                  const Text("가디건", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  Image.asset("assets/clothes/short_shirt.png", width: 140, height: 140,),
                  const Text("반팔", style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700
                  ))
                ],
              ),
            ),
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  Image.asset("assets/clothes/long_pants.png", width: 140, height: 140,),
                  const Text("긴바지", style: TextStyle(
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
    else if (tempurture >= 20 && tempurture < 30) {
      return SizedBox(
        height: 470,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Container(
          width: 300,
          height: 150,
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
              Image.asset("assets/clothes/short_shirt.png", width: 140, height: 140,),
              const Text("반팔", style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700
              ))
            ],
          ),
        ),
        Container(
          width: 300,
          height: 150,
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
              Image.asset("assets/clothes/long_pants.png", width: 140, height: 140,),
              const Text("긴바지", style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700
              ))
            ],
          ),
        )])
      );
    }
    else {
      return SizedBox(
          height: 470,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 300,
                  height: 150,
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
                      Image.asset("assets/clothes/short_shirt.png", width: 140, height: 140,),
                      const Text("반팔", style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700
                      ))
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 150,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                      Image.asset("assets/clothes/short_pants.png", width: 140, height: 140,),
                      const Text("반바지", style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700
                      ))
                    ],
                  ),
                )])
      );
    }
  }
}