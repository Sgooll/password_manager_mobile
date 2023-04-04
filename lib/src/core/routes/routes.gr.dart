// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i6;

import '../../feature/auth/auth_page.dart' as _i1;
import '../../feature/passwords/passwords_page.dart' as _i3;
import '../../feature/qr/qr_page.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    PasswordsRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    PasswordsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PasswordsPage(),
      );
    },
    QrRoute.name: (routeData) {
      final args = routeData.argsAs<QrRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.QrPage(
          key: args.key,
          parentContext: args.parentContext,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          AuthRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          PasswordsRouter.name,
          path: 'passwords',
          children: [
            _i5.RouteConfig(
              PasswordsRoute.name,
              path: '',
              parent: PasswordsRouter.name,
            ),
            _i5.RouteConfig(
              QrRoute.name,
              path: 'qr',
              parent: PasswordsRouter.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i5.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class PasswordsRouter extends _i5.PageRouteInfo<void> {
  const PasswordsRouter({List<_i5.PageRouteInfo>? children})
      : super(
          PasswordsRouter.name,
          path: 'passwords',
          initialChildren: children,
        );

  static const String name = 'PasswordsRouter';
}

/// generated route for
/// [_i3.PasswordsPage]
class PasswordsRoute extends _i5.PageRouteInfo<void> {
  const PasswordsRoute()
      : super(
          PasswordsRoute.name,
          path: '',
        );

  static const String name = 'PasswordsRoute';
}

/// generated route for
/// [_i4.QrPage]
class QrRoute extends _i5.PageRouteInfo<QrRouteArgs> {
  QrRoute({
    _i6.Key? key,
    required _i6.BuildContext parentContext,
  }) : super(
          QrRoute.name,
          path: 'qr',
          args: QrRouteArgs(
            key: key,
            parentContext: parentContext,
          ),
        );

  static const String name = 'QrRoute';
}

class QrRouteArgs {
  const QrRouteArgs({
    this.key,
    required this.parentContext,
  });

  final _i6.Key? key;

  final _i6.BuildContext parentContext;

  @override
  String toString() {
    return 'QrRouteArgs{key: $key, parentContext: $parentContext}';
  }
}
