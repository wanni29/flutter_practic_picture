import 'dart:developer';

import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';
import 'package:flutter_practice_picture/data/models/product.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/widgets/product_detail_app_bar.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/widgets/product_detail_button.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/widgets/product_detail_mid.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/widgets/product_detail_price_and_rate.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/widgets/product_detail_rating_star.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/widgets/product_detail_selected_model.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/widgets/product_detail_top.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // 본 코드
    return Scaffold(
      // 단순히 AppBar()만 만들어두 arrow_back_ios 아이콘이 제공이되며,
      // 로직을 따로 안만들어두 되네 ? -> 간단하구 좋네 : )
      appBar: ProductDetailAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProductDetailTop(product: widget.product),
              const SizedBox(height: 20.0),
              ProductDetailMid(product: widget.product),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        child: Image.asset(
                            "assets/images/standard_chair_front.png"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 10,
                            height: 20,
                            child: CustomPaint(
                              painter: drawLineHorizen(),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Text("80.50", style: Roboto.sp15w500gray),
                          const SizedBox(width: 5.0),
                          Container(
                            width: 10,
                            height: 20,
                            child: CustomPaint(
                              painter: drawLineHorizen(),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 40,
                        child: CustomPaint(
                          painter: drawLineVertical(),
                        ),
                      ),
                      Text("120.50", style: Roboto.sp15w500gray),
                      Container(
                        width: 50,
                        height: 40,
                        child: CustomPaint(
                          painter: drawLineVertical(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        child: Image.asset(
                            "assets/images/standard_chair_side.png"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 10,
                            height: 20,
                            child: CustomPaint(
                              painter: drawLineHorizen(),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Text("95.50", style: Roboto.sp15w500gray),
                          const SizedBox(width: 5.0),
                          Container(
                            width: 10,
                            height: 20,
                            child: CustomPaint(
                              painter: drawLineHorizen(),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ProductDetailButton(),
    );
  }
}

class drawLineVertical extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    // 수직선
    canvas.drawLine(
      Offset(size.width / 2, 10),
      Offset(size.width / 2, size.height - 10),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class drawLineHorizen extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey // 선의 색상 설정
      ..strokeWidth = 2; // 선의 두께 설정

    // 수평선 그리기
    canvas.drawLine(
      Offset(10, size.height / 2),
      Offset(size.width - 10, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
