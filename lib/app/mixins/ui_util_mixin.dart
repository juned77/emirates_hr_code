import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin UiUtilMixin {
  void showSnackBar(BuildContext context, {String message = '', bool isError = false}) {
    hapticSelectionClick();

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: isError ? Colors.white : null),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: isError ? Colors.red : null,
        ),
      );
  }

  void unFocusFromAll() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void showErrorSnackBar(BuildContext context, {String message = '', bool isError = true, Widget? content}) {
    hapticSelectionClick();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: content ??
              Text(
                message,
                style: TextStyle(color: isError ? Colors.white : null),
              ),
          duration: const Duration(seconds: 4),
          backgroundColor: isError ? Colors.red : null,
        ),
      );
  }

  void hapticSelectionClick() {
    HapticFeedback.selectionClick();
  }
}
