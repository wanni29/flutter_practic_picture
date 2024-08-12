import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("테스트 전용 페이지 입니다.", style: Roboto.sp32w500),
        Text("라우팅을 점검하세요 : ) ", style: Roboto.sp32w500)
      ],
    );
  }
}
