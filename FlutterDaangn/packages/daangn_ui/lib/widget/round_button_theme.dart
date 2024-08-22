import 'package:daangn_ui/common/dart/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../common/constant/app_colors.dart';

enum RoundButtonTheme {
  orange(AppColors.brightGrey, Colors.black87, AppColors.brightGrey, backgroundColorProvider: orangeColorProvider),
  border(Colors.transparent, AppColors.brightGrey, AppColors.darkGrey,
      backgroundColorProvider: orangeColorProvider),
  blink(AppColors.darkOrange, Colors.white, Colors.black, backgroundColorProvider: orangeColorProvider);

  const RoundButtonTheme(
      this.bgColor,
      this.textColor,
      this.borderColor, {
        this.backgroundColorProvider,
      }) : shadowColor = Colors.transparent;

  ///RoundButtonTheme 안에서 Custome Theme 분기가 필요하다면 이렇게 함수로 사용
  final Color Function(BuildContext context)? backgroundColorProvider;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final Color shadowColor;
}

Color orangeColorProvider(BuildContext context) => context.appColors.orangeButtonBackground;

Color Function(BuildContext context) defaultColorProvider(Color color) => orangeColorProvider;

// enum RoundButtonTheme {
//   blue(AppColors.blue, Colors.white, AppColors.blue, backgroundColorProvider: blueColorProvider),
//   whiteWithBlueBorder(Colors.white, AppColors.darkBlue, AppColors.blue,
//       backgroundColorProvider: blueColorProvider),
//   blink(AppColors.blue, Colors.white, Colors.black, backgroundColorProvider: blueColorProvider);
//
//   const RoundButtonTheme(
//     this.bgColor,
//     this.textColor,
//     this.borderColor, {
//     this.backgroundColorProvider,
//   }) : shadowColor = Colors.transparent;
//
//   ///RoundButtonTheme 안에서 Custome Theme 분기가 필요하다면 이렇게 함수로 사용
//   final Color Function(BuildContext context)? backgroundColorProvider;
//   final Color bgColor;
//   final Color textColor;
//   final Color borderColor;
//   final Color shadowColor;
// }
//
// Color blueColorProvider(BuildContext context) => context.appColors.blueButtonBackground;
//
// Color Function(BuildContext context) defaultColorProvider(Color color) => blueColorProvider;
