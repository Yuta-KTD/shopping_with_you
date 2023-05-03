import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shopping_with_you/ui/component/form_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ログイン')),
      body: Center(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormTextField(
                name: 'userName',
                onChanged: (value) {
                  print(value);
                },
              ),
              FormTextField(
                name: 'password',
                onChanged: (value) {
                  print(value);
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
