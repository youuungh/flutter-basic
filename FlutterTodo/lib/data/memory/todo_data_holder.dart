import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/data/memory/todo_data_notifier.dart';
import 'package:flutter_todo/data/memory/todo_status.dart';
import 'package:flutter_todo/data/memory/vo_todo.dart';
import 'package:flutter_todo/screen/dialog/d_confirm.dart';
import 'package:get/get.dart';
import 'package:riverpod/riverpod.dart';

import '../../screen/main/write/d_write_todo.dart';

/// Riverpod

// final todoDataProvider = StateNotifierProvider<TodoDataHolder, List<Todo>>((ref) => TodoDataHolder());
//
// class TodoDataHolder extends StateNotifier<List<Todo>> {
//
//   TodoDataHolder() : super([]);
//
//   void changeTodoStatus(Todo todo) async {
//     switch (todo.status) {
//       case TodoStatus.incomplete:
//         todo.status = TodoStatus.ongoing;
//       case TodoStatus.ongoing:
//         todo.status = TodoStatus.complete;
//       case TodoStatus.complete:
//         final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
//         result?.runIfSuccess((data) {
//           todo.status = TodoStatus.incomplete;
//         });
//     }
//     state = List.of(state);
//   }
//
//   void addTodo() async {
//     final result = await WriteTodoDialog().show();
//     if (result != null) {
//       state.add(Todo(
//         id: DateTime.now().millisecondsSinceEpoch,
//         title: result.text,
//         dueDate: result.dateTime,
//       ));
//       state = List.of(state);
//     }
//   }
//
//   void editTodo(Todo todo) async {
//     final result = await WriteTodoDialog(todoForEdit: todo).show();
//     if (result != null) {
//       todo.title = result.text;
//       todo.dueDate = result.dateTime;
//       state = List.of(state);
//     }
//   }
//
//   void removeTodo(Todo todo) {
//     state.remove(todo);
//     state = List.of(state);
//   }
// }
//
// extension TodoListHolderProvider on WidgetRef {
//   TodoDataHolder get readTodoHolder => read(todoDataProvider.notifier);
// }

/// GetX

// class TodoDataHolder extends GetxController {
//   final RxList<Todo> todoList = <Todo>[].obs;
//
//   void changeTodoStatus(Todo todo) async {
//     switch (todo.status) {
//       case TodoStatus.incomplete:
//         todo.status = TodoStatus.ongoing;
//       case TodoStatus.ongoing:
//         todo.status = TodoStatus.complete;
//       case TodoStatus.complete:
//         final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
//         result?.runIfSuccess((data) {
//           todo.status = TodoStatus.incomplete;
//         });
//     }
//     todoList.refresh();
//     //update();
//   }
//
//   void addTodo() async {
//     final result = await WriteTodoDialog().show();
//     if (result != null) {
//       todoList.add(Todo(
//         id: DateTime.now().millisecondsSinceEpoch,
//         title: result.text,
//         dueDate: result.dateTime,
//       ));
//       //update();
//     }
//   }
//
//   void editTodo(Todo todo) async {
//     final result = await WriteTodoDialog(todoForEdit: todo).show();
//     if (result != null) {
//       todo.title = result.text;
//       todo.dueDate = result.dateTime;
//       todoList.refresh();
//       //update();
//     }
//   }
//
//   void removeTodo(Todo todo) {
//     todoList.remove(todo);
//     todoList.refresh();
//     //update();
//   }
// }
//
// mixin class TodoDataProvider {
//   late final TodoDataHolder todoData = Get.find();
// }

/// Default

// class TodoDataHolder extends InheritedWidget {
//   final TodoDataNotifier notifier;
//
//   const TodoDataHolder({
//     super.key,
//     required super.child,
//     required this.notifier,
//   });
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return true;
//   }
//
//   static TodoDataHolder _of(BuildContext context) {
//     TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
//     return inherited;
//   }
//
//   void changeTodoStatus(Todo todo) async {
//     switch (todo.status) {
//       case TodoStatus.incomplete:
//         todo.status = TodoStatus.ongoing;
//       case TodoStatus.ongoing:
//         todo.status = TodoStatus.complete;
//       case TodoStatus.complete:
//         final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
//         result?.runIfSuccess((data) {
//           todo.status = TodoStatus.incomplete;
//         });
//     }
//     notifier.notify();
//   }
//
//   void addTodo() async {
//     final result = await WriteTodoDialog().show();
//     if (result != null) {
//       notifier.addTodo(Todo(
//         id: DateTime.now().millisecondsSinceEpoch,
//         title: result.text,
//         dueDate: result.dateTime,
//       ));
//     }
//   }
//
//   void editTodo(Todo todo) async {
//     final result = await WriteTodoDialog(todoForEdit: todo).show();
//     if (result != null) {
//       todo.title = result.text;
//       todo.dueDate = result.dateTime;
//       notifier.notify();
//     }
//   }
//
//   void removeTodo(Todo todo) {
//     notifier.value.remove(todo);
//     notifier.notify();
//   }
// }
//
// extension TodoDataHolderContextExtension on BuildContext {
//   TodoDataHolder get holder => TodoDataHolder._of(this);
// }
