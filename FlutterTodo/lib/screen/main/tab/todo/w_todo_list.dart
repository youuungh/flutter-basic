import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/common/common.dart';
import 'package:flutter_todo/data/memory/bloc/todo_bloc_state.dart';
import 'package:flutter_todo/data/memory/todo_cubit.dart';
import 'package:flutter_todo/data/memory/vo_todo.dart';
import 'package:flutter_todo/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../data/memory/todo_bloc.dart';
import '../../../../data/memory/todo_data.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

/// Api

class _TodoListState extends State<TodoList> with TodoDataProvider {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => !todoData.isLoaded.value ? const Center(child: CircularProgressIndicator(),)
          : todoData.todoList.isEmpty
          ? '할일을 작성해보세요'.text.size(30).makeCentered()
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: todoData.todoList
              .map((e) => TodoItem(
            todo: e,
          ))
              .toList(),
        ),
      ),
    );
  }
}

/// LocalDB

// class _TodoListState extends State<TodoList> with TodoDataProvider {
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//           () => todoData.todoList.isEmpty
//           ? '할일을 작성해보세요'.text.size(30).makeCentered()
//           : SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: todoData.todoList
//               .map((e) => TodoItem(
//             todo: e,
//           ))
//               .toList(),
//         ),
//       ),
//     );
//   }
// }

/// Riverpod

// class TodoList extends ConsumerWidget {
//
//   const TodoList({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final todoList = ref.watch(todoDataProvider);
//
//     return todoList.isEmpty
//         ? '할일을 작성해보세요.'.text.size(30).makeCentered()
//         : Column(
//       children: todoList.map((e) => TodoItem(e)).toList(),
//     );
//   }
// }


/// Bloc

// class TodoList extends StatelessWidget {
//   const TodoList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TodoBloc, TodoBlocState>(builder: (context, state) {
//       return state.todoList.isEmpty
//           ? '할일을 작성해보세요.'.text.size(30).makeCentered()
//           : Column(
//         children: state.todoList.map((e) => TodoItem(e)).toList(),
//       );
//     });
//   }

/// Cubit

// class TodoList extends StatelessWidget {
//   const TodoList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TodoCubit, TodoBlocState>(builder: (context, state) {
//       return state.todoList.isEmpty
//           ? '할일을 작성해보세요.'.text.size(30).makeCentered()
//           : Column(
//               children: state.todoList.map((e) => TodoItem(e)).toList(),
//             );
//     });
//   }
// }

/// GetX

// class TodoList extends StatelessWidget with TodoDataProvider {
//   //const TodoList({super.key});
//   TodoList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => todoData.todoList.isEmpty
//         ? '할일을 작성해보세요.'.text.size(30).makeCentered()
//         : Column(
//             children: todoData.todoList.map((e) => TodoItem(e)).toList(),
//           ));
//   }
// }

/// Default

// @override
// Widget build(BuildContext context) {
//   return ValueListenableBuilder(
//     valueListenable: context.holder.notifier,
//     builder: (context, todoList, child) {
//       return todoList.isEmpty
//           ? '할일을 작성해보세요.'.text.size(30).makeCentered()
//           : Column(
//         children: todoList.map((e) => TodoItem(e)).toList(),
//       );
//     },
//   );
// }
