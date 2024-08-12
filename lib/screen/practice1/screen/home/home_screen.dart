import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/data/models/product.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/home_screen_view_model.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/widgets/home_screen_bottom.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/widgets/home_screen_mid.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/widgets/home_screen_top.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  double _headerHeight = 105.0;
  bool checkSliver = false;

  void _handleScroll(double pixels) {
    // 스크롤 위치에 따라 실제 상태가 변경될 때만 setState 호출
    final newCheckSliver = pixels > 180;
    if (newCheckSliver != checkSliver) {
      setState(() {
        _headerHeight = newCheckSliver ? 160 : 105;
        checkSliver = newCheckSliver;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = ref.read(homeScreenProvier.notifier);

    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: homeScreenProvider.getProductList(), // 제품 목록을 불러오는 Future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 데이터 로딩 중일 때 로딩 인디케이터 표시
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // 오류가 발생했을 때 오류 메시지 표시
            return Center(
              child: Text('오류가 발생했습니다: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            // 데이터가 성공적으로 로드되었을 때 UI 표시
            List<Product> productList = snapshot.data ?? [];

            return NotificationListener<ScrollNotification>(
              // onNotification: (scrollNotification) {
              //   if (scrollNotification is ScrollUpdateNotification) {
              //     _handleScroll(scrollNotification.metrics.pixels);
              //   }
              //   return true;
              // },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 80),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: HomeScreenTop(),
                          ),
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      floating: false,
                      delegate: _SliverAppBarDelegate(
                        minHeight: _headerHeight,
                        maxHeight: _headerHeight,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Visibility(
                                visible: checkSliver,
                                child: const SizedBox(height: 50),
                              ),
                              const HomeScreenMid(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.zero,
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => HomeScreenBottom(
                            productList: productList,
                          ),
                          childCount: productList.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // 기본적으로 데이터가 없을 때 빈 화면 표시
            return const Center(
              child: Text('No products available'),
            );
          }
        },
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: maxHeight,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
