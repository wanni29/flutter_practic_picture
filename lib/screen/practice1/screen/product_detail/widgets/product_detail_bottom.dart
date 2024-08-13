import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/product_detail/product_detail_screen.dart';

class ProductDetailBottom extends StatelessWidget {
  const ProductDetailBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              width: 150,
              height: 100,
              child: Image.asset("assets/images/standard_chair_front.png"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 10,
                  height: 20,
                  child: CustomPaint(
                    painter: drawLineHorizen(),
                  ),
                ),
                const SizedBox(width: 5.0),
                Text("80.50", style: Roboto.sp15w500gray),
                const SizedBox(width: 5.0),
                Container(
                  width: 10,
                  height: 20,
                  child: CustomPaint(
                    painter: drawLineHorizen(),
                  ),
                )
              ],
            )
          ],
        ),
        Column(
          children: [
            Container(
              width: 50,
              height: 40,
              child: CustomPaint(
                painter: drawLineVertical(),
              ),
            ),
            Text("120.50", style: Roboto.sp15w500gray),
            Container(
              width: 50,
              height: 40,
              child: CustomPaint(
                painter: drawLineVertical(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 150,
              height: 100,
              child: Image.asset("assets/images/standard_chair_side.png"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 10,
                  height: 20,
                  child: CustomPaint(
                    painter: drawLineHorizen(),
                  ),
                ),
                const SizedBox(width: 5.0),
                Text("95.50", style: Roboto.sp15w500gray),
                const SizedBox(width: 5.0),
                Container(
                  width: 10,
                  height: 20,
                  child: CustomPaint(
                    painter: drawLineHorizen(),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class drawLineVertical extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    // 수직선
    canvas.drawLine(
      Offset(size.width / 2, 10),
      Offset(size.width / 2, size.height - 10),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class drawLineHorizen extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey // 선의 색상 설정
      ..strokeWidth = 2; // 선의 두께 설정

    // 수평선 그리기
    canvas.drawLine(
      Offset(10, size.height / 2),
      Offset(size.width - 10, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
