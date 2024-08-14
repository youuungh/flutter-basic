import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/common/data/preference/app_shared_preference.dart';
import 'package:flutter_todo/data/memory/app_block/app_block_observer.dart';
import 'package:flutter_todo/data/memory/app_block/app_event_transformer.dart';

import 'app.dart';
import 'common/data/preference/app_preferences.dart';
import 'data/local/local_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppPreferences.init();
  //await LocalDB.init();

  await AppSharedPreference.init();
  final count = AppSharedPreference.getCount();

  Bloc.observer = AppBlockObserver();
  Bloc.transformer = appEventTransformer;

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ko')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: const App()));
}
