import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/src/utils/extensions/context.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final bool hideText;
  final Color? borderColor;
  final TextStyle? textColor;
  final double? width;
  final TextInputType? inputType;
  final List<TextInputFormatter>? textInputFormatters;

  const CustomTextField(
      {Key? key,
      required this.textController,
      required this.labelText,
      this.hideText = false,
      this.borderColor,
      this.textColor,
      this.width,
      this.inputType = TextInputType.text,
      this.textInputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 4,
            ),
          ],
        ),
        child: TextField(
          enableSuggestions: false,
          keyboardType: inputType,
          inputFormatters: textInputFormatters,
          cursorColor: context.theme.primaryColor,
          obscureText: hideText,
          controller: textController,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              floatingLabelStyle: context.theme.textTheme.displayLarge,
              suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: textController.clear,
                  icon: CircleAvatar(
                      backgroundColor:
                          context.theme.primaryColor.withOpacity(0.05),
                      child: Icon(
                        Icons.clear,
                        size: 14,
                        color: context.theme.primaryColor,
                      ))),
              iconColor: context.theme.primaryColor,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: context.theme.primaryColor.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(8.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: context.theme.primaryColor.withOpacity(1)),
                  borderRadius: BorderRadius.circular(8.0)),
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.grey.withOpacity(1))),
          style: textColor ?? context.theme.textTheme.displayMedium,
        ),
      ),
    );
  }
}
