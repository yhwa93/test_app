import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap(){

    //current state가 null인지 확인
    if(_formkey.currentState != null){

      //formkey가 존재
      if(_formkey.currentState!.validate()){

        //form save -> onSaved 콜백함수
        _formkey.currentState!.save();

        //온보딩으로 이동


        //map 확인
        print(formData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인"),
      ),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '이메일',
                ),
                validator: (value){
                  return null;
                },
                onSaved: (newValue) => {
                  if(newValue != null){
                    formData['email'] = newValue
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '비밀번호',
                ),
                validator: (value){
                  return null;
                },
                onSaved: (newValue) => {
                  if(newValue != null){
                    formData['password'] = newValue
                  }
                },
              ),
              GestureDetector(
                onTap: _onSubmitTap,
                child: const FormButton(disabled: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
