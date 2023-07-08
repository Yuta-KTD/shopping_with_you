import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_with_you/core/go_router.dart';
import 'package:shopping_with_you/view/component/form_text_field.dart';

class SignInSceen extends ConsumerWidget {
  SignInSceen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ふたりのお買い物'),
      ),
      body: Center(
        child: Column(
          children: [
            FormBuilder(
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
                    onPressed: () => _submit(context),
                    child: const Text('ログイン'),
                  ),
                ],
              ),
            ),
            TextButton(
              child: const Text('ユーザー作成はこちらから'),
              onPressed: () => ref.read(routerProvier).go('/signup'),
            ),
          ],
        ),
      ),
    );
  }

  _fieldOnChanged(String? value) {
    _formKey.currentState?.save();
  }

  _submit(BuildContext context) async {
    debugPrint(_formKey.currentState?.value['userName']);
    debugPrint(_formKey.currentState?.value['password']);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _formKey.currentState?.value['userName'],
        password: _formKey.currentState?.value['password'],
      );
      // TODO: 認証機能を別管理して、その結果をlistenまたはwatchして遷移するようにする
      context.goNamed('/purchase');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
