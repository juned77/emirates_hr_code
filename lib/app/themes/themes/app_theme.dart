import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import 'icon_theme_extension.dart';
import 'text_theme_extension.dart';

class AppTheme {
  factory AppTheme() => _singleton;

  AppTheme._internal();

  final ThemeData darkTheme = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        // backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        minimumSize: MaterialStateProperty.all(const Size(120, 48)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      enableFeedback: true,
      selectedLabelStyle: TextStyle(color: Colors.white),
      unselectedLabelStyle: TextStyle(color: Colors.white),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16),
        ),
        side: MaterialStateProperty.all(const BorderSide(color: Colors.white)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.all(const Size(120, 48)),
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[
      const TextThemeExtension(textBaseWidgetColor: Colors.white),
      const IconThemeExtension()
    ],
  );

  final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,

    colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
    primaryColorLight: AppColors.primaryColorLight,
    primaryColorDark: AppColors.primaryColorDark,
    useMaterial3: true,
    progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primaryColor),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    // textTheme: const TextTheme().apply(bodyColor: Colors.green),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: AppColors.pantone)),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16),
        ),
        minimumSize: MaterialStateProperty.all(const Size(120, 48)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(120, 48)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      enableFeedback: true,
      backgroundColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Colors.white),
      unselectedLabelStyle: TextStyle(color: Colors.white),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    checkboxTheme: const CheckboxThemeData(visualDensity: VisualDensity.compact),
    extensions: const <ThemeExtension<dynamic>>[
      TextThemeExtension(textBaseWidgetColor: Colors.black),
      IconThemeExtension(backIconColor: Colors.black)
    ],
  );

  static final AppTheme _singleton = AppTheme._internal();

  ThemeData getTheme() => lightTheme;
}
