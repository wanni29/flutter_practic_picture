import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';

class LoginBottomText extends StatelessWidget {
  const LoginBottomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColorsV1.gray.shade400,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 32.0,
          ),
          child: Text("Or login with", style: Roboto.sp15w500),
        ),
        Expanded(
          child: Divider(
            color: AppColorsV1.gray.shade400,
            thickness: 1,
          ),
        )
      ],
    );
  }
}
