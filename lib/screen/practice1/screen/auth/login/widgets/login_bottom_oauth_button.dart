import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';

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
