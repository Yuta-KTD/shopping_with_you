import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shopping_with_you/view/component/form_text_field.dart';

class SingInSceen extends StatefulWidget {
  const SingInSceen({super.key});

  @override
  State<SingInSceen> createState() => _SingInSceenState();
}

class _SingInSceenState extends State<SingInSceen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
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
                onPressed: _submit(),
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

  _submit() async {
    debugPrint(_formKey.currentState?.value['userName']);
    debugPrint(_formKey.currentState?.value['password']);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _formKey.currentState?.value['userName'],
        password: _formKey.currentState?.value['password'],
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
