import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/src/config/constants/api_constants.dart';
import 'package:password_manager/src/data/repository/main.dart';

import '../../core/routes/routes.gr.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FloatingActionButton(
          onPressed: () {

            context.router.replace(const PasswordsRouter());
          },
        ),
      ),
    );
  }
}
