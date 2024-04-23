import 'package:flutter/material.dart';
import 'package:test_app/features/authentication/password_screen.dart';
import 'widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  String _email = "";

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  String? _isEmailValidation() {
    if (_email.isEmpty) return null;

    final regEx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regEx.hasMatch(_email)) {
      return "형식에 맞지 않는 이메일입니다.";
    }

    return null;
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValidation() != null) return;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PasswordScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("회원가입 : 이메일"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("이메일을 작성하세요."),
            TextField(
              controller: _emailController,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              onEditingComplete: _onSubmit,
              decoration: InputDecoration(
                hintText: "사용자 이메일",
                errorText: _isEmailValidation(),
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
            GestureDetector(
              onTap: _onSubmit,
              child: FormButton(
                disabled: _email.isEmpty || _isEmailValidation() != null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
