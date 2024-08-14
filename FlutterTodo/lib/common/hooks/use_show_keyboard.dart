import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo/common/util/app_keyboard_util.dart';

_useShowKeyboard(BuildContext context, FocusNode node) {
  useMemoized(() {
    AppKeyboardUtil.show(context, node);
  });
}

showKeyboard(FocusNode node) {
  final context = useContext();
  _useShowKeyboard(context, node);
}