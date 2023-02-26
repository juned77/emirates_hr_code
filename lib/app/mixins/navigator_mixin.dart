import 'package:flutter/material.dart';

import '../utils/constants.dart';

mixin NavigatorMixin {
  void goScreen(BuildContext context, String location, {Object? extra}) {
    // GoRouter.of(context).push(location, extra: extra);
  }

  void popScreen({Object? result}) => navigatorKey.currentState?.pop(result);

  Future<T?> pushScreen<T>({BuildContext? context, required Widget page}) async {
    T? response = await navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => page,
    ));
    return response;
  }

  void pushReplacement({BuildContext? context, required Widget page}) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pushAndRemoveUntil({BuildContext? context, required Widget page}) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }
}
