import 'package:flutter_todo/common/cli_common.dart';
import 'package:flutter_todo/common/common.dart';
import 'package:flutter_todo/data/memory/todo_status.dart';
import 'package:flutter_todo/data/memory/vo_todo.dart';
import 'package:flutter_todo/data/todo_repository.dart';
import 'package:flutter_todo/screen/dialog/d_confirm.dart';
import 'package:flutter_todo/screen/main/write/d_write_todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screen/dialog/d_message.dart';
import '../local/local_db.dart';
import '../remote/result/api_error.dart';
import '../remote/todo_api.dart';
import '../simple_result.dart';

/// Api

class TodoData extends GetxController {
  final RxList<Todo> todoList = <Todo>[].obs;
  final RxBool isLoaded = false.obs;

  final todoRepository = TodoApi.instance;
  //final todoRepository = LocalDB.instance;

  @override
  void onInit() async {
    final remoteTodoList = await todoRepository.getTodoList();
    isLoaded.value = true;
    remoteTodoList.runIfSuccess((data) {
      todoList.addAll(data);
    });
    remoteTodoList.runIfFailure((error) {
      delay(() {
        MessageDialog(error.message).show();
      }, 100.ms);
    });
    super.onInit();
  }

  int get newId {
    return DateTime.now().millisecondsSinceEpoch;
  }

  void addTodo(BuildContext context) async {
    final result = await WriteTodoBottomSheet().show();
    result?.runIfSuccess((data) async {
      final newTodo = Todo(
        id: newId,
        title: data.title,
        dueDate: data.dueDate,
        createdTime: DateTime.now(),
        status: TodoStatus.incomplete,
      );
      final requestResult = await todoRepository.addTodo(newTodo);
      requestResult.runIfSuccess((data) => todoList.add(newTodo));
      requestResult.runIfFailure((error) {
        switch(error.networkErrorType){

          case NetworkErrorType.networkConnectionError:
          //재시도를 3번
          case NetworkErrorType.serviceError:
            MessageDialog(error.message).show();
        }
      });
    });
  }

  void changeTodoStatus(Todo todo) async {
    TodoStatus nextStatus = todo.status;
    switch (todo.status) {
      case TodoStatus.complete:
        final result = await ConfirmDialog('다시 처음 상태로 변경하시겠어요?').show();
        if (result?.isFailure == true) {
          return;
        }
        result?.runIfSuccess((data) {
          nextStatus = TodoStatus.incomplete;
        });
      case TodoStatus.incomplete:
        nextStatus = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        nextStatus = TodoStatus.complete;
      case TodoStatus.unknown:
        return;
    }
    final Todo todoForSave = todo.copyWith(status: nextStatus);
    final responseResult = await todoRepository.updateTodo(todoForSave); //객체 안의 status 바꿔서 update요청
    processResponseResult(responseResult, todoForSave);
  }

  editTodo(Todo todo) async {
    final result = await WriteTodoBottomSheet(todoForEdit: todo).show();
    final Todo todoForSave = todo.copyWith();

    result?.runIfSuccess((data) async {
      todoForSave.modifyTime = DateTime.now();
      todoForSave.title = data.title;
      todoForSave.dueDate = data.dueDate;

      final responseResult = await todoRepository.updateTodo(todoForSave);
      processResponseResult(responseResult, todoForSave);
    });
  }

  void processResponseResult(SimpleResult<void, ApiError> result, Todo updatedTodo) {
    result.runIfSuccess((data) => updateTodo(updatedTodo));
    result.runIfFailure((error) => MessageDialog(error.message).show());
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
    todoRepository.removeTodo(todo.id);
  }

  updateTodo(Todo updatedTodo) {
    final todo = todoList.firstWhere((element) => element.id == updatedTodo.id);
    todo
      ..title = updatedTodo.title
      ..status = updatedTodo.status
      ..dueDate = updatedTodo.dueDate;

    todoList.refresh();
  }
}

mixin class TodoDataProvider {
  late final TodoData todoData = Get.find();
}

/// LocalDB

// class TodoData extends GetxController {
//   final RxList<Todo> todoList = <Todo>[].obs;
//
//   //final TodoRepository todoRepository = TodoApi.instance;
//   final TodoRepository todoRepository = LocalDB.instance;
//
//   @override
//   void onInit() async {
//     final getTodoResult = await todoRepository.getTodoList();
//     getTodoResult.runIfSuccess((data) {
//       todoList.addAll(data);
//     });
//
//     super.onInit();
//   }
//
//   int get newId {
//     return DateTime.now().millisecondsSinceEpoch;
//   }
//
//   void addTodo(BuildContext context) async {
//     final result = await WriteTodoBottomSheet().show();
//     result?.runIfSuccess((data) {
//       final newTodo = Todo(
//         id: newId,
//         title: data.title,
//         dueDate: data.dueDate,
//       );
//       todoList.add(newTodo);
//       todoRepository.addTodo(newTodo);
//     });
//   }
//
//   void changeTodoStatus(Todo todo) async {
//     switch (todo.status) {
//       case TodoStatus.complete:
//         final result = await ConfirmDialog('다시 처음 상태로 변경하시겠어요?').show();
//         result?.runIfSuccess((data) {
//           todo.status = TodoStatus.incomplete;
//         });
//       case TodoStatus.incomplete:
//         todo.status = TodoStatus.ongoing;
//       case TodoStatus.ongoing:
//         todo.status = TodoStatus.complete;
//     }
//     updateTodo(todo);
//   }
//
//   editTodo(Todo todo) async {
//     final result = await WriteTodoBottomSheet(todoForEdit: todo).show();
//     result?.runIfSuccess((data) {
//       todo.modifyTime = DateTime.now();
//       todo.title = data.title;
//       todo.dueDate = data.dueDate;
//     });
//     updateTodo(todo);
//   }
//
//   void updateTodo(Todo todo) {
//     todoRepository.updateTodo(todo);
//     notify(todo);
//   }
//
//   void notify(Todo todo) {
//     final index = todoList.indexOf(todo);
//     todoList[index] = todo;
//   }
//
//   void removeTodo(Todo todo) {
//     todoList.remove(todo);
//     todoRepository.removeTodo(todo.id);
//   }
// }
//
// mixin class TodoDataProvider {
//   late final TodoData todoData = Get.find();
// }
