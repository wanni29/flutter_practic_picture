import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';

class LoginMidButton extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const LoginMidButton({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: AppColorsV1.gray.shade300,
          borderRadius: BorderRadius.circular(50),
        ),
        height: 60,
        width: double.infinity,
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: selectedIndex == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 32,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppColorsV1.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => onSelect(0),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: selectedIndex == 0
                              ? Colors.black
                              : Colors.grey[600],
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => onSelect(1),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: selectedIndex == 1
                              ? Colors.black
                              : Colors.grey[600],
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
