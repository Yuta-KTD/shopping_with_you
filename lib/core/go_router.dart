import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_with_you/view/screen/add_purchase_screen.dart';
import 'package:shopping_with_you/view/screen/purchase_screen.dart';
import 'package:shopping_with_you/view/screen/sign_in_screen.dart';
import 'package:shopping_with_you/view/screen/sign_up_screen.dart';

/// go_routerのルーティング設定
final routerProvier = Provider((ref) => GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: SignInScreen.rootName,
          builder: (BuildContext context, GoRouterState state) {
            return SignInScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'signup',
              name: SignUpScreen.rootName,
              builder: (BuildContext context, GoRouterState state) =>
                  SignUpScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/purchase',
          name: PurchaseScreen.rootName,
          builder: (context, state) {
            return const PurchaseScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'signup',
              name: AddPurchaseScreen.rootName,
              builder: (BuildContext context, GoRouterState state) =>
                  AddPurchaseScreen(),
            ),
          ],
        )
      ],
    ));
