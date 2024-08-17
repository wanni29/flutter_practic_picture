import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;

  const CustomButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("버튼이 클릭되었어요 : ) ");
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: AppColorsV1.mainCobalt,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(title, style: Roboto.sp20w500white),
        ),
      ),
    );
  }
}
