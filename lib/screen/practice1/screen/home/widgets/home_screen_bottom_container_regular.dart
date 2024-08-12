import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';

class HomeScreenBottomContainerRegular extends StatelessWidget {
  final String imgUrl;
  final String title;
  final int price;

  const HomeScreenBottomContainerRegular({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    const customTextStyle = TextStyle(
        fontFamily: "Roboto",
        fontSize: 15,
        fontWeight: FontWeight.w900,
        color: AppColorsV1.mainCobalt);

    return Container(
      width: 190,
      height: 260,
      decoration: BoxDecoration(
        color: const Color(0xFFEBF7FC),
        borderRadius: BorderRadius.circular(36.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imgUrl,
                height: 170,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: Roboto.sp15w500,
            ),
            Text(
              "\$$price",
              style: customTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
