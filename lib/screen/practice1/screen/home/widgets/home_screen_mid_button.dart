import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreenMidButton extends StatelessWidget {
  final IconData iconName;
  final int? itemCount;
  final Color chooseColor;

  const HomeScreenMidButton({
    super.key,
    this.itemCount,
    required this.iconName,
    required this.chooseColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0), // 버튼의 모서리를 둥글게 설정
          ),
          backgroundColor: AppColorsV1.white, // 버튼의 배경색을 설정
          padding: EdgeInsets.symmetric(vertical: 10), // 버튼 안의 패딩을 설정
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5.0),
              FaIcon(
                iconName,
                color: chooseColor,
                size: 25,
              ),
              const SizedBox(height: 10.0),
              Visibility(
                visible: itemCount != null,
                child: Text('$itemCount', style: Roboto.sp15w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
