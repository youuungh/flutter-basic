import 'package:flutter_todo/common/data/preference/item/nullable_preference_item.dart';
import 'package:flutter_todo/common/theme/custom_theme.dart';

import 'item/preference_item.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
  static final count = PreferenceItem<bool>('count', true);
  static final launchCount = PreferenceItem<int>('launchCount', 0);
}

main() {
  Prefs.launchCount.set(200);
  final launchCount = Prefs.launchCount.get();
}