import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/data/models/product.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/widgets/home_screen_bottom_container_regular.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/widgets/home_screen_bottom_container_small.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreenBottom extends StatelessWidget {
  final List<Product> productList;

  const HomeScreenBottom({
    super.key,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MasonryGridView.count(
        padding: const EdgeInsets.only(top: 20.0),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // 스크롤 충돌 방지
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return _buildProductItem(index);
        },
      ),
    );
  }

  Widget _buildProductItem(int index) {
    if (index % 4 == 0 || index % 4 == 3) {
      return HomeScreenBottomContainerSmall(
        key: UniqueKey(), // 각 아이템에 고유한 키를 부여
        product: productList[index],
      );
    } else {
      return HomeScreenBottomContainerRegular(
        key: UniqueKey(), // 각 아이템에 고유한 키를 부여
        product: productList[index],
      );
    }
  }
}
