import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Modals {
  Modals._();

  static showModal(BuildContext context, {required Widget child}) {
    showCupertinoModalPopup(
        context: context, builder: (context) => child);
  }
}
