import 'package:flutter_ttoss/common/common.dart';
import 'package:flutter_ttoss/common/theme/color/dark_app_colors.dart';
import 'package:flutter_ttoss/common/theme/color/light_app_colors.dart';
import 'package:flutter_ttoss/common/theme/shadows/dart_app_shadows.dart';
import 'package:flutter_ttoss/common/theme/shadows/light_app_shadows.dart';
import 'package:flutter/material.dart';

enum CustomTheme {
  dark(
    DarkAppColors(),
    DarkAppShadows(),
  ),
  light(
    LightAppColors(),
    LightAppShadows(),
  );

  const CustomTheme(this.appColors, this.appShadows);

  final AbstractThemeColors appColors;
  final AbsThemeShadows appShadows;

  ThemeData get themeData {
    switch (this) {
      case CustomTheme.dark:
        return darkTheme;
      case CustomTheme.light:
        return lightTheme;
    }
  }
}

MaterialColor primarySwatchColor = Colors.lightBlue;

ThemeData lightTheme = ThemeData(
    primarySwatch: primarySwatchColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    // textTheme: GoogleFonts.singleDayTextTheme(
    //   ThemeData(brightness: Brightness.light).textTheme,
    // ),
    colorScheme: const ColorScheme.light(background: Colors.white));

ThemeData darkTheme = ThemeData(
    primarySwatch: primarySwatchColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.veryDarkGrey,
    // textTheme: GoogleFonts.nanumMyeongjoTextTheme(
    //   ThemeData(brightness: Brightness.dark).textTheme,
    // ),
    colorScheme: const ColorScheme.dark(surface: AppColors.veryDarkGrey));
