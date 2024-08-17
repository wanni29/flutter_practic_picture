import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';

class LoginTop extends StatelessWidget {
  const LoginTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Go ahead and set up",
              style: Roboto.sp32w500white.copyWith(height: 0.8)),
          Text("your account", style: Roboto.sp32w500white),
          const SizedBox(height: 10),
          Text("Sign-in up to enjoy the best managing experience",
              style: Roboto.sp15w500gray)
        ],
      ),
    );
  }
}
