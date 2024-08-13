import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/data/models/product.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/widgets/product_detail_price_and_rate.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/widgets/product_detail_selected_model.dart';

class ProductDetailTop extends StatefulWidget {
  final Product product;

  const ProductDetailTop({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailTop> createState() => _ProductDetailTopState();
}

class _ProductDetailTopState extends State<ProductDetailTop> {
  Color selectedColor = Colors.white;
  bool checkChoice1 = false;
  bool checkChoice2 = false;
  bool checkChoice3 = false;

  void changeColor(Color choiceColor, int choice) {
    setState(() {
      selectedColor = choiceColor;
      checkChoice1 = choice == 1;
      checkChoice2 = choice == 2;
      checkChoice3 = choice == 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Positioned.fill(
              left: 15.0,
              top: 15.0,
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEBF7FC),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 250,
              height: 250,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  selectedColor,
                  BlendMode.modulate, // 색상을 섞는 방식
                ),
                child: Image.asset(
                  widget.product.imgUrl,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ProductDetailSelectModel(
                    checkChoice: checkChoice1,
                    color: const Color.fromARGB(255, 235, 70, 70),
                    imgUrl: widget.product.imgUrl,
                    onTap: () {
                      changeColor(const Color.fromARGB(255, 235, 70, 70), 1);
                    },
                  ),
                  ProductDetailSelectModel(
                    checkChoice: checkChoice2,
                    color: const Color.fromRGBO(68, 138, 255, 1),
                    imgUrl: widget.product.imgUrl,
                    onTap: () {
                      changeColor(const Color.fromRGBO(68, 138, 255, 1), 2);
                    },
                  ),
                  ProductDetailSelectModel(
                    checkChoice: checkChoice3,
                    color: Colors.yellow,
                    imgUrl: widget.product.imgUrl,
                    onTap: () {
                      changeColor(Colors.yellow, 3);
                    },
                  ),
                  const SizedBox(height: 5.0),
                  ProductDetailPriceAndRate(product: widget.product)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
