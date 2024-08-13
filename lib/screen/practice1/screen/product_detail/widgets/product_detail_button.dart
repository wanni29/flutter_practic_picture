import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';

class ProductDetailButton extends StatelessWidget {
  const ProductDetailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: BottomAppBar(
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
