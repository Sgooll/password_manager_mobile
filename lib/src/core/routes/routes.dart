import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/auth_page.dart';
import '../../feature/passwords/passwords_page.dart';
import '../../feature/qr/qr_page.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: [
  AutoRoute(
      initial: true,
      page: AuthPage
  ),
  AutoRoute(
    page: EmptyRouterPage,
    name: 'PasswordsRouter',
    path: 'passwords',
    children: [
      AutoRoute(
        page: PasswordsPage,
        path: '',
      ),
      AutoRoute(
        page: QrPage,
        path: 'qr',
      ),

    ]
  ),

])
class $AppRouter {}
