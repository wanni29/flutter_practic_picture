import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/widgets/home_screen_bottom.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/widgets/home_screen_mid.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/widgets/home_screen_top.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _headerHeight = 105.0;
  bool checkSliver = false;

  void _handleScroll(double pixels) {
    setState(() {
      // 정확한 고정 시점을 설정합니다.
      if (pixels > 180) {
        // 고정이 되었다고 판단되는 위치에서 높이 변경
        _headerHeight = 160;
        checkSliver = true;
      } else {
        // 스크롤이 충분히 올라와 고정이 풀릴 때 원래 높이로 되돌립니다.
        _headerHeight = 105;
        checkSliver = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            _handleScroll(scrollNotification.metrics.pixels);
          }
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
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
                          child: SizedBox(height: 50),
                        ),
                        const HomeScreenMid(),
                      ],
                    ), // 고정된 버튼들
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.zero,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => HomeScreenBottom(), // 스크롤되는 그리드뷰
                    childCount: 1, // 필요한 만큼 추가
                  ),
                ),
              ),
            ],
          ),
        ),
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
