import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/data/memory/bloc/todo_bloc_state.dart';
import 'package:flutter_todo/data/memory/bloc/todo_event.dart';
import 'package:flutter_todo/data/memory/todo_data_notifier.dart';
import 'package:flutter_todo/data/memory/todo_status.dart';
import 'package:flutter_todo/data/memory/vo_todo.dart';
import 'package:flutter_todo/screen/dialog/d_confirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../screen/main/write/d_write_todo.dart';
import 'bloc/bloc_status.dart';

/// Cubit

// class TodoCubit extends Cubit<TodoBlocState> {
//   TodoCubit() : super(const TodoBlocState(BlocStatus.initial, <Todo>[]));
//
//   void changeTodoStatus(Todo todo) async {
//     final copiedOldTodoList = List.of(state.todoList);
//     final todoIndex =
//         copiedOldTodoList.indexWhere((element) => element.id == todo.id);
//
//     TodoStatus status = todo.status;
//     switch (todo.status) {
//       case TodoStatus.incomplete:
//         status = TodoStatus.ongoing;
//       case TodoStatus.ongoing:
//         status = TodoStatus.complete;
//       case TodoStatus.complete:
//         final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
//         result?.runIfSuccess((data) {
//           status = TodoStatus.incomplete;
//         });
//     }
//     copiedOldTodoList[todoIndex] = todo.copyWith(status: status);
//     emitNewList(copiedOldTodoList);
//   }
//
//   void emitNewList(List<Todo> copiedOldTodoList) {
//     emit(state.copyWith(todoList: copiedOldTodoList));
//   }
//
//   void addTodo() async {
//     final result = await WriteTodoDialog().show();
//     if (result != null) {
//       final copiedOldTodoList = List.of(state.todoList);
//       copiedOldTodoList.add(Todo(
//           id: DateTime.now().millisecondsSinceEpoch,
//           title: result.text,
//           dueDate: result.dateTime,
//           createdTime: DateTime.now(),
//           status: TodoStatus.incomplete));
//       emitNewList(copiedOldTodoList);
//     }
//   }
//
//   void editTodo(Todo todo) async {
//     final result = await WriteTodoDialog(todoForEdit: todo).show();
//     if (result != null) {
//       final oldCopiedList = List<Todo>.from(state.todoList);
//       oldCopiedList[oldCopiedList.indexOf(todo)] =
//           todo.copyWith(title: result.text, dueDate: result.dateTime);
//       emitNewList(oldCopiedList);
//     }
//   }
//
//   void removeTodo(Todo todo) {
//     final oldCopiedList = List<Todo>.from(state.todoList);
//     oldCopiedList.removeWhere((element) => element.id == todo.id);
//     emitNewList(oldCopiedList);
//   }
// }
