import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/src/config/constants/ui_constants.dart';
import 'package:password_manager/src/core/routes/routes.gr.dart';
import 'package:password_manager/src/feature/components/draggable/draggable.dart';
import 'package:password_manager/src/feature/passwords/widgets/add_password.dart';
import 'package:password_manager/src/feature/passwords/widgets/password_card.dart';
import 'package:password_manager/src/utils/modals/modals.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../config/colors.dart';

class PasswordsPage extends StatelessWidget {
  const PasswordsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Connected"),
        actions: [
          GestureDetector(
            onTap: () => _onScan(context),
            child: const Padding(
              padding: UiConstants.fullEdgeInsets,
              child: Icon(Icons.qr_code),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modals.showModal(context, child: AddPasswordWidget()),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: UiConstants.kHorizontalPadding,
            vertical: UiConstants.kVerticalPadding),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return DraggableItemWidget(
              child: const PasswordCard());
            }),
      ),
    );
  }

  _onScan(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();

    final status = await Permission.camera.request();

    if (status.isDenied || status.isPermanentlyDenied || status.isRestricted) {
      return;
    } else {
      context.router.push(QrRoute(parentContext: context));
    }
  }
}
