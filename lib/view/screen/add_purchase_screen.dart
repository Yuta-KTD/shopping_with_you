import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_with_you/view/component/form_text_field.dart';

class AddPurchaseScreen extends ConsumerWidget {
  AddPurchaseScreen({super.key});
  static const rootName = 'addPurchase';

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('お買い物を記録する')),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormTextField(
              name: 'date',
              onChanged: (value) => _fieldOnChanged(value),
            ),
            FormTextField(
              name: 'name',
              onChanged: (value) => _fieldOnChanged(value),
            ),
            FormTextField(
              name: 'amount',
              onChanged: (value) => _fieldOnChanged(value),
            ),
            FormTextField(
              name: 'count',
              onChanged: (value) => _fieldOnChanged(value),
            ),
            FormTextField(
              name: 'category',
              onChanged: (value) => _fieldOnChanged(value),
            ),
            ElevatedButton(
              onPressed: () => _submit(context),
              child: const Text('ログイン'),
            ),
          ],
        ),
      ),
    );
  }

  _fieldOnChanged(String? value) {
    _formKey.currentState?.save();
  }

  _submit(BuildContext context) async {}
}
