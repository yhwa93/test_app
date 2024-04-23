import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/features/onboarding/interests_screen.dart';
import 'widgets/form_button.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  //날짜 초기값
  DateTime initialDate = DateTime.now();

  //useEffect
  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }


  void _setTextFieldDate(DateTime date){
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _onNextTap(){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const InterestsScreen()
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("회원가입 : 생일"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              enabled: false,
              controller: _birthdayController,
              decoration: const InputDecoration(
                hintText: "생일을 입력하세요.",
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
                disabled: false,
              ),
            )
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          height: 200,
          child: CupertinoDatePicker(
            maximumDate: initialDate,
            initialDateTime: initialDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}
