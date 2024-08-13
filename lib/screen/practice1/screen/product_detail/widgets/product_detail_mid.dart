import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';
import 'package:flutter_practice_picture/data/models/product.dart';

class ProductDetailMid extends StatelessWidget {
  final Product product;

  const ProductDetailMid({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    String fullTitle = product.title;

    // 띄어쓰기를 기준으로 문자열을 나눔
    List<String> spliteTitle = fullTitle.split(" ");

    // 각 부분을 변수에 저장
    final String titleName = spliteTitle[0];
    final String titleNumber = spliteTitle[1];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titleName, style: Roboto.sp32w500),
                Text(titleNumber, style: Roboto.sp32w500),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFEBF7FC),
                  borderRadius: BorderRadius.circular(50.0)),
              width: 50,
              height: 60,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  size: 30,
                  color: AppColorsV1.mainCobaltLight,
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                product.description,
                style: Roboto.sp18w500gray,
              ),
            ),
            const SizedBox(width: 90)
          ],
        ),
      ],
    );
  }
}
