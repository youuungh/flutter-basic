import 'package:flutter_bitcoin_monitor/common/data/preference/item/nullable_preference_item.dart';
import 'package:flutter_bitcoin_monitor/common/theme/custom_theme.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
}
