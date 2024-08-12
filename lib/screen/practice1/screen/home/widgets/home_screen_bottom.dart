import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/data/models/product.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/home_screen.dart';
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
    return MasonryGridView.count(
      padding: const EdgeInsets.only(top: 20.0),
      crossAxisCount: 2, // 한 행에 두 개의 타일을 배치
      mainAxisSpacing: 16, // 타일 간의 수직 간격
      crossAxisSpacing: 16, // 타일 간의 수평 간격
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(), // 스크롤을 부모 위젯에 맡김
      itemCount: productList.length, // 아이템 개수
      itemBuilder: (context, index) {
        if (index % 4 == 0 || index % 4 == 3) {
          return HomeScreenBottomContainerSmall(
            title: productList[index].title,
            imgUrl: productList[index].imgUrl,
            price: productList[index].price,
          ); // 첫 번째와 네 번째 타일에 작은 컨테이너
        } else {
          return HomeScreenBottomContainerRegular(
            title: productList[index].title,
            imgUrl: productList[index].imgUrl,
            price: productList[index].price,
          ); // 두 번째와 세 번째 타일에 큰 컨테이너
        }
      },
    );
  }
}
