import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTextField extends StatelessWidget {
  final String name;
  final ValueChanged<String?>? onChanged;
  final TextInputType? keyboardType;
  final List<String>? autofillHints;
  final bool? obscureText;
  const FormTextField({
    super.key,
    required this.name,
    this.onChanged,
    this.keyboardType,
    this.obscureText,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      autofillHints: autofillHints,
      obscureText: obscureText ?? false,
    );
  }
}
