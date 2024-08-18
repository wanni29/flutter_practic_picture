import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';
import 'package:flutter_practice_picture/screen/components/custom_button.dart';
import 'package:flutter_practice_picture/screen/components/custom_text_form_field.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/auth/login/widgets/login_app_bar.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/auth/login/widgets/login_bottom_text.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/auth/login/widgets/login_mid.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/auth/login/widgets/login_screen_form.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/auth/login/widgets/login_top.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _selectedIndex = 0;

  void _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsV1.black,
      // appBar: const LoginAppBar(),
      body: Stack(
        children: [
          // 배경 이미지
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // 배경 이미지 경로
              fit: BoxFit.cover,
            ),
          ),
          // 그라데이션 오버레이
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(1), // 시작점 (더 어두운 부분)
                    Colors.black.withOpacity(0.8), // 중간 지점 (투명)
                  ],
                ),
              ),
            ),
          ),
          // 콘텐츠
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginAppBar(),
              const SizedBox(height: 40),
              const LoginTop(),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColorsV1.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        LoginMidButton(
                          selectedIndex: _selectedIndex,
                          onSelect: _onSelect,
                        ),
                        const SizedBox(height: 30),
                        if (_selectedIndex == 0) ...{
                          const LoginScreenForm()
                        } else ...{
                          // 회원가입 그리기
                        }
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
