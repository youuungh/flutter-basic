import 'package:flutter_daangn/common/data/preference/item/nullable_preference_item.dart';
import 'package:daangn_ui/common/theme/custom_theme.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
}
