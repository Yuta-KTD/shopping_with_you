import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_with_you/core/go_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvier);

    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // routerConfigでrouterDelegateやbackButtonDispatcherなどをまとめて設定してくれる
      // NOTE: 今後ルーティングで課題が出たらrouterDelegateなどを個別設定する
      routerConfig: router,
    );
  }
}
