import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/data/models/product.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/product_detail_screen.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/widgets/product_detail_rating_star.dart';

class ProductDetailPriceAndRate extends StatelessWidget {
  const ProductDetailPriceAndRate({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "\$${product.price}",
            style: Roboto.sp24w500,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CustomAnimatedRatingStars(
              initialRating: product.rate,
              filledColor: Colors.amber,
              emptyColor: Colors.grey,
              customFilledIcon: Icons.star,
              customHalfFilledIcon: Icons.star_half,
              customEmptyIcon: Icons.star_border,
              starSize: 15.0,
              onChanged: (rating) {},
              readOnly: true,
            ),
          )
        ],
      ),
    );
  }
}
