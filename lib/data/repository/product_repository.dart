import 'dart:developer';

import 'package:flutter_practice_picture/core/dio.dart';
import 'package:flutter_practice_picture/data/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const productRepo = Provider<ProductRepository>;

class ProductRepository {
  // 상품리스트 조회
  Future<List<Product>?> getProductList() async {
    try {
      final response = await dio.get("/products");

      // JSON 데이터를 List 형태로 받았을 때 처리
      List<dynamic> data = response.data as List<dynamic>;

      // 각 JSON 객체를 Product객체로 반환
      List<Product> productList = data
          .map((json) => Product.fromJson(json as Map<String, dynamic>))
          .toList();
      return productList;
    } catch (e) {
      log(e.toString());
      throw Exception("오류가 발생했습니다. => ProductRepository를 확인하세요 !");
    }
  }
}
