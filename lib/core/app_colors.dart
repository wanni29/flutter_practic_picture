import 'package:flutter/material.dart';

class AppColorsV1 {
  // main Color
  static const mainCobalt = Color(0xFF29c8d6);
  static const mainCobaltLight = Color(0xFF00CDE4);
  static const mainBrown = Color(0xFF382111);
  static const mainGray = Color(0xFFb6d1de);

  // basic Color
  static const black = Colors.black;
  static const white = Colors.white;
  static const gray = Colors.grey;
  static const lightGray = Color(0xFFD3D3D3);

  static const mainGradient = LinearGradient(
    begin: Alignment.centerLeft, // 왼쪽 가운데에서 시작
    end: Alignment(0.5, 0), // 가로 중앙까지 그라데이션
    colors: [Color(0xFF29c8d6), Color(0xFF88eaf7)],
  );
}
