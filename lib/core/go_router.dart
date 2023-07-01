import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_with_you/view/screen/sign_in_screen.dart';
import 'package:shopping_with_you/view/screen/sign_up_screen.dart';

/// go_routerのルーティング設定
final routerProvier = Provider((ref) => GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return SignInSceen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'signup',
              builder: (BuildContext context, GoRouterState state) =>
                  SignUpScreen(),
            )
          ],
        ),
      ],
    ));
