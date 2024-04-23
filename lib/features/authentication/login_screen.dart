import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/features/authentication/login_form_screen.dart';
import 'package:test_app/features/authentication/username_screen.dart';
import 'widgets/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LoginFormScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              '서비스 로그인',
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
              label: '사용자 전화번호 혹은 이메일 로그인',
              onTabFunction: _onEmailTap,
            ),
            AuthButton(
              icon: const FaIcon(FontAwesomeIcons.apple),
              label: '애플 로그인',
              onTabFunction: _onEmailTap,
            ),
            AuthButton(
              icon: const FaIcon(FontAwesomeIcons.google),
              label: '구글 로그인',
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
            const Text('계정이 아직 없으신가요?'),
            GestureDetector(
              onTap: () => _onSignUpTap(context),
              child: const Text(
                '회원가입',
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
