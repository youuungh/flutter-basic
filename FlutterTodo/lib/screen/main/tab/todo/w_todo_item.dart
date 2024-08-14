import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/common/common.dart';
import 'package:flutter_todo/common/dart/extension/datetime_extension.dart';
import 'package:flutter_todo/common/widget/w_rounded_container.dart';
import 'package:flutter_todo/data/memory/bloc/todo_event.dart';
import 'package:flutter_todo/screen/main/tab/todo/w_todo_status.dart';
import 'package:flutter/material.dart';

import '../../../../data/memory/todo_data.dart';
import '../../../../data/memory/vo_todo.dart';

class TodoItem extends StatelessWidget with TodoDataProvider {
  final Todo todo;

  TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      background: RoundedContainer(
        color: context.appColors.removeTodoBg,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Width(20),
            Icon(
              EvaIcons.trash2Outline,
              color: Colors.white,
            ),
          ],
        ),
      ),
      secondaryBackground: RoundedContainer(
        color: context.appColors.removeTodoBg,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              EvaIcons.trash2Outline,
              color: Colors.white,
            ),
            Width(20),
          ],
        ),
      ),
      onDismissed: (direction) {
        todoData.removeTodo(todo);
      },
      child: RoundedContainer(
        margin: const EdgeInsets.symmetric(vertical: 3),
        color: context.appColors.itemBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            todo.dueDate.relativeDays.text.size(10).medium.make(),
            Row(
              children: [
                TodoStatusWidget(todo),
                Expanded(child: todo.title.text.size(20).medium.make()),
                IconButton(
                    onPressed: () => todoData.editTodo(todo),
                    icon: const Icon(EvaIcons.editOutline)),
              ],
            ),
          ],
        ).pOnly(top: 15, right: 15, bottom: 10, left: 5),
      ),
    );
  }
}

/// Riverpod

// class TodoItem extends ConsumerWidget {
//   final Todo todo;
//
//   const TodoItem(this.todo, {super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Dismissible(
//       onDismissed: (direction) {
//         ref.readTodoHolder.removeTodo(todo);
//       },
//       background: RoundedContainer(
//         color: context.appColors.removeTodoBg,
//         child: const Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Width(20),
//             Icon(
//               EvaIcons.trash2Outline,
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ).pOnly(top: 3, bottom: 3),
//       secondaryBackground: RoundedContainer(
//         color: context.appColors.removeTodoBg,
//         child: const Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Icon(
//               EvaIcons.trash2Outline,
//               color: Colors.white,
//             ),
//             Width(20),
//           ],
//         ),
//       ).pOnly(top: 3, bottom: 3),
//       key: ValueKey(todo.id),
//       child: RoundedContainer(
//           margin: const EdgeInsets.only(top: 3, bottom: 3),
//           color: context.appColors.itemBackground,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               todo.dueDate.relativeDays.text.make(),
//               Row(
//                 children: [
//                   TodoStatusWidget(todo),
//                   Expanded(child: todo.title.text.size(20).medium.make()),
//                   IconButton(
//                       onPressed: () async {
//                         ref.readTodoHolder.editTodo(todo);
//                       },
//                       icon: const Icon(EvaIcons.editOutline))
//                 ],
//               )
//             ],
//           ).pOnly(top: 15, right: 15, left: 5, bottom: 10)),
//     );
//   }
// }

/// GetX
//class TodoItem extends StatelessWidget with TodoDataProvider {

/// Cubit
// class TodoItem extends StatelessWidget {
//   final Todo todo;
//
//   const TodoItem(this.todo, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       onDismissed: (direction) {
//         //context.holder.removeTodo(todo);
//         //context.readTodoCubit.removeTodo(todo);
//         context.readTodoBloc.add(TodoRemovedEvent(todo));
//       },
//       background: RoundedContainer(
//         color: context.appColors.removeTodoBg,
//         child: const Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Width(20),
//             Icon(
//               EvaIcons.trash2Outline,
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ).pOnly(top: 3, bottom: 3),
//       secondaryBackground: RoundedContainer(
//         color: context.appColors.removeTodoBg,
//         child: const Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Icon(
//               EvaIcons.trash2Outline,
//               color: Colors.white,
//             ),
//             Width(20),
//           ],
//         ),
//       ).pOnly(top: 3, bottom: 3),
//       key: ValueKey(todo.id),
//       child: RoundedContainer(
//           margin: const EdgeInsets.only(top: 3, bottom: 3),
//           color: context.appColors.itemBackground,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               todo.dueDate.relativeDays.text.make(),
//               Row(
//                 children: [
//                   TodoStatusWidget(todo),
//                   Expanded(child: todo.title.text.size(20).medium.make()),
//                   IconButton(
//                       onPressed: () async {
//                         //context.holder.editTodo(todo);
//                         //context.readTodoCubit.editTodo(todo);
//                         context.readTodoBloc.add(TodoContentUpdateEvent(todo));
//                       },
//                       icon: const Icon(EvaIcons.editOutline))
//                 ],
//               )
//             ],
//           ).pOnly(top: 15, right: 15, left: 5, bottom: 10)),
//     );
//   }
// }
