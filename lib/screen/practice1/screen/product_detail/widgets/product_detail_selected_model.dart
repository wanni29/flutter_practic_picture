import 'package:flutter/material.dart';

class ProductDetailSelectModel extends StatelessWidget {
  final bool checkChoice;
  final Color color;
  final String imgUrl;
  final VoidCallback onTap;

  const ProductDetailSelectModel({
    super.key,
    required this.checkChoice,
    required this.color,
    required this.imgUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Stack(
          children: [
            Visibility(
              visible: checkChoice == true,
              child: Positioned.fill(
                left: 15.0,
                top: 15.0,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEBF7FC),
                  ),
                ),
              ),
            ),
            Container(
              width: 70,
              height: 70,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  color,
                  BlendMode.modulate, // 색상을 섞는 방식
                ),
                child: Image.asset(
                  alignment: Alignment.centerRight,
                  imgUrl,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
