import 'package:flutter/material.dart' show Color, ThemeExtension, immutable;

@immutable
class IconThemeExtension extends ThemeExtension<IconThemeExtension> {
  const IconThemeExtension({this.backIconColor});

  final Color? backIconColor;

  @override
  IconThemeExtension copyWith({Color? brandColor, Color? backIconColor, Color? danger}) {
    return IconThemeExtension(
      backIconColor: brandColor ?? backIconColor,
    );
  }

  @override
  IconThemeExtension lerp(ThemeExtension<IconThemeExtension>? other, double t) {
    if (other is! IconThemeExtension) {
      return this;
    }
    return IconThemeExtension(
      backIconColor: Color.lerp(backIconColor, other.backIconColor, t),
    );
  }

  @override
  String toString() => 'BackIconColor: $backIconColor)';
}
