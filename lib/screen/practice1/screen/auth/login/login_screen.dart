import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';
import 'package:flutter_practice_picture/screen/components/custom_button.dart';
import 'package:flutter_practice_picture/screen/components/custom_text_form_field.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/auth/login/widgets/login_app_bar.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/auth/login/widgets/login_bottom_text.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/auth/login/widgets/login_mid.dart';
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
                          // 로그인 그리기
                          Column(
                            children: [
                              CustomTextFormField(
                                icon: Icon(
                                  Icons.email_outlined,
                                  color: AppColorsV1.mainCobalt,
                                ),
                                hintText: 'Email Address',
                              ),
                              const SizedBox(height: 20),
                              CustomTextFormField(
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: AppColorsV1.mainCobalt,
                                ),
                                hintText: 'Password',
                                shadowPassword: true,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        child: Checkbox(
                                          value: false,
                                          onChanged: null,
                                        ),
                                      ),
                                      Text(
                                        "Remember me",
                                        style: Roboto.sp15w500,
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("비밀번호 찾기 페이지로 ! ");
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: Roboto.sp15w500mainCobalt,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              const CustomButton(title: "Login"),
                              const LoginBottomText(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LoginBottomOAuthButton(
                                    logoText: "Google",
                                    logoUrl: "assets/images/logo/google.png",
                                  ),
                                  const SizedBox(width: 10.0),
                                  LoginBottomOAuthButton(
                                    logoText: "Facebook",
                                    logoUrl: "assets/images/logo/facebook.png",
                                  )
                                ],
                              )
                            ],
                          )
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

class LoginBottomOAuthButton extends StatelessWidget {
  final String logoText;
  final String logoUrl;

  const LoginBottomOAuthButton({
    super.key,
    required this.logoText,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColorsV1.gray.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 35,
              child: Image.asset(logoUrl),
            ),
            Text(
              logoText,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
