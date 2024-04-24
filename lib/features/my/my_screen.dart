import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/features/main_navigation/main_navigation_screen.dart';

class MyScreen extends StatelessWidget {
  const MyScreen(this.tab, {super.key});

  final String tab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () => context.go('/my?show=reports'),
            child: Text('reports'),
          ),
          GestureDetector(
            onTap: () => context.go('/my?show=profile'),
            child: Text('profile'),
          ),
          Text(tab == 'reports' ? '리포트 탭' : '프로필 탭'),
        ],
      ),
      bottomNavigationBar: MainNavigationScreen(),
    );
  }
}
