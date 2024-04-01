import 'package:flutter/material.dart';
import 'package:password_manager/src/utils/extensions/context.dart';

import '../../../../config/colors.dart';
import '../../loading/loading_widget.dart';
import 'primary_button_controller.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    Key? key,
    this.color,
    this.borderRadius = 100,
    this.border,
    this.textStyle,
    this.padding,
    required this.title,
    this.icon,
    this.height,
    this.textMaxLines,
    this.textOverflow,
    required this.onPressed,
    this.toUpperCase = true,
    this.controller,
    this.alignment,
    this.expanded = true,
    this.secondary = false,
  }) : super(key: key);

  final Color? color;
  final double borderRadius;
  final BorderSide? border;
  final TextStyle? textStyle;
  final String? title;
  final Function()? onPressed;
  final ButtonController? controller;
  final EdgeInsets? padding;
  final Icon? icon;
  final double? height;
  final bool toUpperCase;
  final int? textMaxLines;
  final TextOverflow? textOverflow;
  final bool expanded;
  final Alignment? alignment;
  final bool secondary;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  late var controller = widget.controller;

  @override
  initState() {
    controller?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  bool _isDisable() {
    if (controller == null) return false;
    return controller!.isState(ButtonState.disable)! ||
        controller!.isState(ButtonState.loading)!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
        alignment: widget.alignment ?? Alignment.center,
        padding: widget.padding,
        child: Opacity(
          opacity: _isDisable() ? .8 : 1,
          child: Container(
            width: widget.expanded ? double.infinity : null,
            decoration: BoxDecoration(
              color: widget.color ?? (widget.secondary ? context.theme.buttonTheme.colorScheme
                  ?.secondary : context.theme.buttonTheme.colorScheme?.primary),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,

              onTap: _isDisable() ? null : widget.onPressed,
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity:
                      (controller?.isState(ButtonState.loading) ?? false)
                          ? 0
                          : 1,
                      child: widget.title != null
                          ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.5),
                        child: Text(
                            widget.title!,
                            maxLines: widget.textMaxLines,
                            overflow: widget.textOverflow,
                            textAlign: TextAlign.center,
                            style: widget.textStyle ??
                                context.theme.textTheme.bodyLarge?.copyWith(
                                    color: widget.secondary ? context.theme
                                        .scaffoldBackgroundColor ==
                                        Colors.white ? context.theme
                                        .primaryColor : Colors.white : Colors.white)),
                      )
                          : widget.icon ?? const SizedBox(),
                    ),
                    (controller?.isState(ButtonState.loading) ?? false)
                        ? const LoadingWidget()
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
