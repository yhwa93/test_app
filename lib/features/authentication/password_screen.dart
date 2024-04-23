import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/features/authentication/birthday_screen.dart';
import 'widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;
  String _password = "";

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onClearTap(){
    _passwordController.clear();
  }

  void _toggleObscureText(){
    _obscureText = !_obscureText;
    setState(() {});
   }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("회원가입 : 비밀번호"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("비밀번호"),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              onEditingComplete: _onSubmit,
              decoration: InputDecoration(
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _onClearTap,
                      child: FaIcon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    GestureDetector(
                      onTap: _toggleObscureText,
                      child: FaIcon(
                        _obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
                hintText: "비밀번호를 작성하세요.",
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            const Text('비밀번호 만족해야하는 조건:'),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  color: _isPasswordValid()
                    ? Colors.green
                    : Colors.grey,
                ),
                Text("8~20개의 문자")
              ],
            ),

            GestureDetector(
              onTap: _onSubmit,
              child: FormButton(
                disabled: !_isPasswordValid(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
