import 'package:flutter_todo/data/memory/bloc/bloc_status.dart';
import 'package:flutter_todo/data/memory/vo_todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_bloc_state.freezed.dart';

@freezed
class TodoBlocState with _$TodoBlocState {
  const factory TodoBlocState(
      BlocStatus status,
      List<Todo> todoList
      ) = _TodoBlocState;
}