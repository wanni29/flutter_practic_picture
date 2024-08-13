import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/data/models/product.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 단순히 AppBar()만 만들어두 arrow_back_ios 아이콘이 제공이되며,
      // 로직을 따로 안만들어두 되네 ? -> 간단하구 좋네 : )
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Alchemist_dev", style: Roboto.sp24w500),
            Text("넘어온 매개변수의 값은 다음과 같습니다.", style: Roboto.sp24w500),
            Text("product title : ${product.title}", style: Roboto.sp24w500),
            Text("product title : ${product.price}", style: Roboto.sp24w500),
          ],
        ),
      ),
    );
  }
}
