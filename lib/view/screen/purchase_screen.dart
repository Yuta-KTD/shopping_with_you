import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PurchaseScreen extends ConsumerWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('買い物記録'),
      ),
      body: const Center(
        child: Text('買い物リスト'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed('/add'),
      ),
    );
  }
}
