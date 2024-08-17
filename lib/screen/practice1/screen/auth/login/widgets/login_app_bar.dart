import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';
import 'package:go_router/go_router.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColorsV1.gray),
          ),
          child: IconButton(
            color: AppColorsV1.white,
            icon: const Icon(Icons.arrow_back_sharp),
            onPressed: () {
              context.pop();
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
