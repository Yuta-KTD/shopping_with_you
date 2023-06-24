import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_with_you/view/component/form_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('サインアップ')),
      body: Center(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormTextField(
                name: 'userName',
                onChanged: (value) => _fieldOnChanged(value),
              ),
              FormTextField(
                name: 'password',
                onChanged: (value) => _fieldOnChanged(value),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () => _submit(),
                child: const Text('サインアップ'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _fieldOnChanged(String? value) {
    _formKey.currentState?.save();
  }

  /// サインアップボタン用
  Future<void> _submit() async {
    debugPrint(_formKey.currentState?.value['userName']);
    debugPrint(_formKey.currentState?.value['password']);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _formKey.currentState?.value['userName'],
        password: _formKey.currentState?.value['password'],
      );
      context.go('/singup');
    } on FirebaseAuthException catch (e) {
      /// パスワードが弱い場合
      if (e.code == 'weak-password') {
        debugPrint('パスワードが弱いです');

        /// メールアドレスが既に使用中の場合
      } else if (e.code == 'email-already-in-use') {
        debugPrint('すでに使用されているメールアドレスです');
      }

      /// その他エラー
      else {
        debugPrint('アカウント作成エラー');
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
