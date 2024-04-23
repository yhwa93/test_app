import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/features/authentication/username_screen.dart';
import 'package:test_app/features/authentication/login_screen.dart';
import 'package:test_app/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTab(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const UserNameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              '서비스 회원가입',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '어쩌고 저쩌고 사용해보세요. 어쩌고 저쩌고 사용해보세요. 어쩌고 저쩌고 사용해보세요.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            AuthButton(
              icon: const FaIcon(FontAwesomeIcons.solidUser),
              label: '사용자 전화번호 혹은 이메일 회원가입',
              onTabFunction: _onEmailTap,
            ),
            AuthButton(
              icon: const FaIcon(FontAwesomeIcons.apple),
              label: '애플 회원가입',
              onTabFunction: _onEmailTap,
            ),
            AuthButton(
              icon: const FaIcon(FontAwesomeIcons.google),
              label: '구글 회원가입',
              onTabFunction: _onEmailTap,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('이미 계정이 있으신가요?'),
            GestureDetector(
              onTap: () => _onLoginTab(context),
              child: const Text(
                '로그인',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
