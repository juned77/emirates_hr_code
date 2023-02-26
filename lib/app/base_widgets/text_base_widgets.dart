import 'package:flutter/material.dart';

import '../themes/themes/text_theme_extension.dart';
import '../utils/constants.dart';
import 'base_stateless_widget.dart';

enum _TextBaseWidgetType { containerized, expanded, iconised }

enum IconDirection { leading, trailing }

class TextBaseWidget extends BaseStatelessWidget {
  const TextBaseWidget({
    Key? key,
    required this.text,
    this.textSize = 14,
    this.width,
    this.decoration,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.textColor,
    this.fontWeight = FontWeight.normal,
    this.backgroundColor = Colors.transparent,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.textStyle,
    this.containerAlignment,
    this.boxConstraints,
    this.maxLines = 3,
    this.height,
    this.fontFamily,
    this.letterSpacing,
    this.lineHeight,
    this.overflow = TextOverflow.ellipsis,
  })  : _textBaseWidgetType = _TextBaseWidgetType.containerized,
        leadingIcon = null,
        leadingGap = null,
        iconDirection = null,
        super(key: key);

  const TextBaseWidget.adaptive({
    Key? key,
    required this.text,
    this.textSize = 14,
    this.width,
    this.height,
    this.containerAlignment,
    this.decoration,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.textColor,
    this.fontWeight = FontWeight.normal,
    this.backgroundColor = Colors.transparent,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.textStyle,
    this.overflow = TextOverflow.ellipsis,
    this.boxConstraints,
    this.maxLines = 3,
    this.fontFamily,
    this.letterSpacing,
    this.lineHeight,
  })  : _textBaseWidgetType = _TextBaseWidgetType.expanded,
        leadingIcon = null,
        leadingGap = null,
        iconDirection = null,
        super(key: key);

  const TextBaseWidget.withIcon({
    Key? key,
    required this.leadingIcon,
    required this.text,
    this.textSize = 14,
    this.width,
    this.height,
    this.containerAlignment,
    this.iconDirection,
    this.decoration,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.textColor,
    this.fontWeight = FontWeight.normal,
    this.backgroundColor = Colors.transparent,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.textStyle,
    this.overflow = TextOverflow.ellipsis,
    this.boxConstraints,
    this.maxLines = 3,
    this.fontFamily,
    this.letterSpacing,
    this.lineHeight,
    this.leadingGap,
  })  : _textBaseWidgetType = _TextBaseWidgetType.iconised,
        super(key: key);

  final Color backgroundColor;
  final BoxConstraints? boxConstraints;
  final AlignmentGeometry? containerAlignment;
  final BoxDecoration? decoration;
  final String? fontFamily;
  final FontWeight fontWeight;
  final double? height;
  final IconDirection? iconDirection;
  final double? leadingGap;
  final Widget? leadingIcon;
  final double? letterSpacing;
  final double? lineHeight;
  final EdgeInsets margin;
  final int? maxLines;
  final TextOverflow? overflow;
  final EdgeInsets padding;
  final String text;
  final TextAlign textAlign;
  final Color? textColor;
  final TextDecoration textDecoration;
  final double textSize;
  final TextStyle? textStyle;
  final double? width;

  final _TextBaseWidgetType _textBaseWidgetType;

  @override
  Widget build(BuildContext context) {
    final TextThemeExtension textThemeExtension = Theme.of(context).extension<TextThemeExtension>()!;
    Widget textWithContainer = Container(
      width: width,
      decoration: decoration,
      height: height,
      padding: padding,
      constraints: boxConstraints,
      margin: margin,
      alignment: containerAlignment,
      child: Text(
        text,
        overflow: overflow,
        maxLines: maxLines,
        style: textStyle ??
            TextStyle(
              letterSpacing: letterSpacing,
              height: lineHeight,
              fontFamily: fontFamily,
              decoration: textDecoration,
              fontSize: textSize,
              color: textColor ?? textThemeExtension.textBaseWidgetColor,
              fontWeight: fontWeight,
            ),
        textAlign: textAlign,
      ),
    );

    if (_textBaseWidgetType == _TextBaseWidgetType.containerized) {
      return textWithContainer;
    } else if (_textBaseWidgetType == _TextBaseWidgetType.expanded) {
      return Expanded(child: textWithContainer);
    } else if (_textBaseWidgetType == _TextBaseWidgetType.iconised) {
      if (iconDirection == null || iconDirection == IconDirection.leading) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [leadingIcon!, SizedBox(width: leadingGap ?? 5), textWithContainer],
        );
      } else {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [textWithContainer, SizedBox(width: leadingGap ?? 5), leadingIcon!],
        );
      }
    } else {
      return kShrinkedBox;
    }
  }
}
