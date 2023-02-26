import 'package:flutter/material.dart';

SizedBox kShrinkedBox = const SizedBox.shrink();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

typedef FromJson<T> = T Function(dynamic json);

List<Widget> widgetWithSeprator({
  required Widget widget,
  bool visible = true,
  double? height,
  double? width,
}) {
  return visible
      ? [
          widget,
          SizedBox(height: height, width: width),
        ]
      : [];
}
