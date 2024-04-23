import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/features/authentication/email_screen.dart';
import 'widgets/form_button.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    if (_username.isEmpty) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원가입 : 유저네임"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("유저네임을 만드세요."),
          const Text("추후에 유저네임은 변경 가능"),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              hintText: "사용자 이름",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
          GestureDetector(
            onTap: _onNextTap,
            child: FormButton(
              disabled: _username.isEmpty,
            ),
          ),
        ],
      ),
    );
  }
}
