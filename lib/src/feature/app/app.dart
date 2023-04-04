import 'package:flutter/material.dart';
import 'package:password_manager/src/core/routes/routes.gr.dart';

import '../../config/theme.dart';

class PasswordManagerApp extends StatelessWidget {
  PasswordManagerApp({Key? key}) : super(key: key);

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
