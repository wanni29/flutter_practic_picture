import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/data/models/product.dart';
import 'package:flutter_practice_picture/data/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터
class HomeScreenModel {
  List<Product> productList;

  HomeScreenModel({
    required this.productList,
  });
}

// 창고 - 통신 코드
class HomeScreenViewModel extends StateNotifier<HomeScreenModel?> {
  HomeScreenViewModel(super._state, this._ref);

  final Ref _ref;

  void clearAll() {
    state = null;
  }

  // 상품리스트 조회
  Future<List<Product>> getProductList() async {
    final response = await ProductRepository().getProductList();
    if (response != null) {
      state?.productList = response;
      return response;
    } else {
      return [];
    }
  }
}

// 창고 관리자
final homeScreenProvier =
    StateNotifierProvider<HomeScreenViewModel, HomeScreenModel?>((ref) {
  return HomeScreenViewModel(null, ref);
});
