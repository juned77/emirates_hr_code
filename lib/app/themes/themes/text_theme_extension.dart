import 'package:flutter/material.dart';

@immutable
class TextThemeExtension extends ThemeExtension<TextThemeExtension> {
  const TextThemeExtension({required this.textBaseWidgetColor});

  final Color? textBaseWidgetColor;

  @override
  TextThemeExtension copyWith({Color? brandColor, Color? backIconColor, Color? danger}) {
    return TextThemeExtension(
      textBaseWidgetColor: brandColor ?? textBaseWidgetColor,
    );
  }

  @override
  TextThemeExtension lerp(ThemeExtension<TextThemeExtension>? other, double t) {
    if (other is! TextThemeExtension) {
      return this;
    }
    return TextThemeExtension(
      textBaseWidgetColor: Color.lerp(textBaseWidgetColor, other.textBaseWidgetColor, t),
    );
  }

  @override
  String toString() => 'TextThemeExtension(textBaseWidgetColor: $textBaseWidgetColor)';
}
