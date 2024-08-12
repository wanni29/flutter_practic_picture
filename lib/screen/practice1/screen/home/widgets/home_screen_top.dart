import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';

class HomeScreenTop extends StatelessWidget {
  const HomeScreenTop({super.key});

  // 필요한 UI는 만들어서 쓰자!

  final textStyle1 = const TextStyle(
    fontFamily: "Roboto",
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: AppColorsV1.white,
  );

  final textStyle2 = const TextStyle(
      fontFamily: "Roboto",
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: AppColorsV1.white,
      height: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        gradient: AppColorsV1.mainGradient,
      ),
      child: Stack(
        //  clipBehavior : Clip.none
        // -> 클립을 비활성화하여  Stack 경계 밖으로 위젯이 나가도록 허용
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 32.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome,",
                      style: Roboto.sp15w500white,
                    ),
                    Text(
                      "Alchemist_dev",
                      style: textStyle1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Column(
                  children: [
                    Text(
                      "30%",
                      style: textStyle2,
                    ),
                    Text(
                      "off",
                      style: textStyle2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 15.0,
            top: 9, // 추가: 이미지가 컨테이너의 바닥에 붙게 설정
            child: Image.asset(
              "assets/images/chair1.png",
              width: 110, // 이미지 크기 조정
            ),
          ),
        ],
      ),
    );
  }
}
