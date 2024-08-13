import 'dart:developer';

import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';
import 'package:flutter_practice_picture/data/models/product.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/widgets/product_detail_app_bar.dart';
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        height: 55,
        shape: const CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColorsV1.mainCobalt,
                AppColorsV1.mainCobalt.withOpacity(0.4)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Center(
            child: Text(
              "Add to Cart",
              style: Roboto.sp24w500white,
            ),
          ),
        ),
      ),
    );
  }
}
