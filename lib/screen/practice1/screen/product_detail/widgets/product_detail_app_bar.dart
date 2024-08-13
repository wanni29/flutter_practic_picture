import 'package:flutter/material.dart';

class ProductDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final double height;

  const ProductDetailAppBar({
    super.key,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height); // AppBar의 높이 설정

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            iconSize: 28.0,
          ),
        ),
      ],
    );
  }
}
