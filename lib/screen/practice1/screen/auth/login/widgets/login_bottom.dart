import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/auth/login/widgets/login_bottom_oauth_button.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LoginBottomOAuthButton(
          logoText: "Google",
          logoUrl: "assets/images/logo/google.png",
        ),
        SizedBox(width: 10.0),
        LoginBottomOAuthButton(
          logoText: "Facebook",
          logoUrl: "assets/images/logo/facebook.png",
        )
      ],
    );
  }
}
