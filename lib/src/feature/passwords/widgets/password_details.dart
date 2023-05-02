import 'package:flutter/material.dart';
import 'package:password_manager/src/config/constants/ui_constants.dart';
import 'package:password_manager/src/utils/extensions/context.dart';

class PasswordDetailsWidget extends StatelessWidget {
  const PasswordDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.heightPx / 2,
      padding: UiConstants.fullEdgeInsets,
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Name', style: context.theme.textTheme.displayMedium,),
          Text('URL', style: context.theme.textTheme.displayMedium,),
          Text('Password', style: context.theme.textTheme.displayMedium,),
        ],

      ),
    );
  }
}
