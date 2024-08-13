import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';
import 'package:flutter_practice_picture/data/models/product.dart';
import 'package:go_router/go_router.dart';

class HomeScreenBottomContainerSmall extends StatelessWidget {
  final Product product;

  const HomeScreenBottomContainerSmall({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    // 필요한 textStyle 만들기
    const customTextStyle = TextStyle(
        fontFamily: "Roboto",
        fontSize: 15,
        fontWeight: FontWeight.w900,
        color: AppColorsV1.mainCobalt);

    // 본 소스코드
    return InkWell(
      onTap: () {
        GoRouter.of(context).push("/product/detail", extra: product);
      },
      child: Container(
        width: 190,
        height: 220,
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
                  product.imgUrl,
                  height: 130,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                product.title,
                style: Roboto.sp15w500,
              ),
              Text(
                "\$${product.price}",
                style: customTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
