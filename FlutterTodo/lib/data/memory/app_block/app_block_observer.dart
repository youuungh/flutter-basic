import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/data/memory/bloc/todo_event.dart';

class AppBlockObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('onChange');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('onClose');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('onCreate');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (event is TodoEvent) {
      switch (event) {
        case TodoAddEvent():
          debugPrint('added Event');
        case TodoStatusUpdateEvent():
          debugPrint('status Updated Event');
        case TodoContentUpdateEvent():
          debugPrint('content Updated Event');
        case TodoRemovedEvent():
          debugPrint('removed Event');
      }
    } else {
      debugPrint('onEvent Others');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('onTransition');
  }
}