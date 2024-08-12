import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/core/app_colors.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/home_screen.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/widgets/test_screen.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home', // 초기 경로를 /home으로 설정
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: SnakeNavigationBar.color(
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.circle,
            padding: EdgeInsets.all(12),
            snakeViewColor: AppColorsV1.mainCobalt,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: AppColorsV1.white,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex:
                state.uri.toString() == '/home' ? 0 : 1, // 현재 경로를 기준으로 인덱스 설정
            onTap: (index) {
              if (index == 0) {
                context.go('/home');
              } else {
                context.go('/test');
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/test',
          builder: (context, state) => const TestScreen(),
        ),
      ],
    ),
  ],
);
