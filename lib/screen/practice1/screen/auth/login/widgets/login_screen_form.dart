import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';
import 'package:flutter_practice_picture/screen/components/custom_button.dart';
import 'package:flutter_practice_picture/screen/components/custom_text_form_field.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/auth/login/widgets/login_bottom_oauth_button.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/auth/login/widgets/login_bottom_text.dart';

class LoginScreenForm extends StatelessWidget {
  const LoginScreenForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
