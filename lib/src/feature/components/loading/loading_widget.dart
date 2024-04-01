import 'package:flutter/material.dart';
import 'package:password_manager/src/utils/extensions/context.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(
      {Key? key,
        this.loadValue,
        this.color,
        this.width = 1,
        this.size = 20,
        this.backgroundColor})
      : super(key: key);

  final double? loadValue;
  final Color? color;
  final Color? backgroundColor;

  final double width;
  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: size,
    height: size,
    child: CircularProgressIndicator(
      color: color ?? context.theme.colorScheme.onBackground,
      strokeWidth: width,
      backgroundColor: backgroundColor,
      value: loadValue,
    ),
  );
}
