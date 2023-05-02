import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/src/feature/components/text_field/custom_text_field.dart';
import 'package:password_manager/src/utils/extensions/context.dart';

import '../../../config/constants/ui_constants.dart';

class AddPasswordWidget extends StatelessWidget {
  AddPasswordWidget({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: UiConstants.fullEdgeInsets,
          color: context.theme.scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextField(textController: nameController, labelText: 'Name'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: UiConstants.kVerticalPadding),
                child: CustomTextField(textController: urlController, labelText: 'Url'),
              ),
              CustomTextField(textController: loginController, labelText: 'Login'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: UiConstants.kVerticalPadding),

                child: CustomTextField(textController: passwordController, labelText: 'Password', hideText: true,),
              ),



            ],
          ),
        ),
      ),
    );
    ;
  }
}
