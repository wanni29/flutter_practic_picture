import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/Roboto.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Setting⚙️",
              style: Roboto.sp32w500,
            )
          ],
        ),
      ),
    );
  }
}
