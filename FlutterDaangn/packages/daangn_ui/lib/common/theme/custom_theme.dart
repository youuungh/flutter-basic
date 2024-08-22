import 'package:daangn_ui/common/theme/color/dark_app_colors.dart';
import 'package:daangn_ui/common/theme/color/light_app_colors.dart';
import 'package:daangn_ui/common/theme/shadows/abs_theme_shadows.dart';
import 'package:daangn_ui/common/theme/shadows/dart_app_shadows.dart';
import 'package:daangn_ui/common/theme/shadows/light_app_shadows.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color/abs_theme_colors.dart';
import 'color/carrot_app_colors.dart';
import 'custom_google_font.dart';

enum CustomTheme {
  dark(
    DarkAppColors(),
    DarkAppShadows(),
    name: '다크',
    color: AppColors.veryDarkGrey,
  ),
  light(
    LightAppColors(),
    LightAppShadows(),
    name: '라이트',
    color: AppColors.brightGrey,
  ),
  carrot(
    CarrotAppColors(),
    LightAppShadows(),
    name: '당근',
    color: AppColors.darkOrange,
  ),
  ;

  const CustomTheme(
      this.appColors,
      this.appShadows, {
        required this.name,
        required this.color,
      });

  final AbstractThemeColors appColors;
  final AbsThemeShadows appShadows;
  final String name;
  final Color color;

  ThemeData get themeData {
    switch (this) {
      case CustomTheme.dark:
        return darkTheme;
      case CustomTheme.light:
        return lightTheme;
      case CustomTheme.carrot:
        return lightTheme;
    }
  }
}

ThemeData carrotTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    textTheme: CustomGoogleFonts.diphylleiaTextTheme(
      ThemeData(brightness: Brightness.light).textTheme,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: CustomTheme.carrot.appColors.seedColor));

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    textTheme: GoogleFonts.aBeeZeeTextTheme(
      ThemeData(brightness: Brightness.light).textTheme,
    ),
    colorScheme:
        ColorScheme.fromSeed(seedColor: CustomTheme.light.appColors.seedColor));

const darkColorSeed = Color(0xbcd5ff7e);
ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.veryDarkGrey,
    // textTheme: GoogleFonts.nanumMyeongjoTextTheme(
    //   ThemeData(brightness: Brightness.dark).textTheme,
    // ),
    // textTheme: CustomGoogleFonts.diphylleiaTextTheme(
    //   ThemeData(brightness: Brightness.dark).textTheme,
    // ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: CustomTheme.dark.appColors.seedColor,
        brightness: Brightness.dark));
