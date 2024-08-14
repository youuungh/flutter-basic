import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/common/common.dart';
import 'package:flutter_todo/data/memory/bloc/todo_event.dart';
import 'package:flutter_todo/data/memory/todo_status.dart';
import 'package:flutter_todo/screen/main/tab/todo/w_fire.dart';
import 'package:flutter/material.dart';

import '../../../../data/memory/todo_data.dart';
import '../../../../data/memory/vo_todo.dart';

/// Api

class TodoStatusWidget extends StatelessWidget with TodoDataProvider {
  final Todo todo;

  TodoStatusWidget(
      this.todo, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Tap(
        onTap: () {
          todoData.changeTodoStatus(todo);
        },
        child: SizedBox(
          height: 50,
          width: 50,
          child: switch (todo.status) {
            TodoStatus.complete => Checkbox(
              value: true,
              onChanged: null,
              fillColor: MaterialStateProperty.all(context.appColors.checkBoxColor),
            ),
            TodoStatus.incomplete => const Checkbox(
              value: false,
              onChanged: null,
            ),
            TodoStatus.ongoing => const Fire(),
            TodoStatus.unknown => const Icon(
              Icons.question_mark,
              size: 25,
            ).centered(),
          },
        ));
  }
}

/// LocalDB

// class TodoStatusWidget extends StatelessWidget with TodoDataProvider {
//   final Todo todo;
//
//   TodoStatusWidget(
//       this.todo, {
//         super.key,
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     return Tap(
//         onTap: () {
//           todoData.changeTodoStatus(todo);
//         },
//         child: SizedBox(
//           height: 50,
//           width: 50,
//           child: switch (todo.status) {
//             TodoStatus.complete => Checkbox(
//               value: true,
//               onChanged: null,
//               fillColor: WidgetStateProperty.all(context.appColors.checkBoxColor),
//             ),
//             TodoStatus.incomplete => const Checkbox(
//               value: false,
//               onChanged: null,
//             ),
//             TodoStatus.ongoing => const Fire(),
//           },
//         ));
//   }
// }

/// Riverpod

// class TodoStatusWidget extends ConsumerWidget {
//   final Todo todo;
//
//   const TodoStatusWidget(this.todo, {super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Tap(
//       onTap: () {
//         ref.readTodoHolder.changeTodoStatus(todo);
//       },
//       child: SizedBox(
//           width: 50,
//           height: 50,
//           child: switch (todo.status) {
//             TodoStatus.complete => Checkbox(
//               value: true,
//               onChanged: null,
//               fillColor: WidgetStateProperty.all(
//                 context.appColors.checkBoxColor,
//               ),
//             ),
//             TodoStatus.incomplete => const Checkbox(
//               value: false,
//               onChanged: null,
//             ),
//             TodoStatus.ongoing => const Fire()
//           }),
//     );
//   }
// }

/// GetX
// class TodoStatusWidget extends StatelessWidget with TodoDataProvider {

/// Cubit
// class TodoStatusWidget extends StatelessWidget {
//   final Todo todo;
//
//   const TodoStatusWidget(this.todo, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Tap(
//       onTap: () {
//         //context.holder.changeTodoStatus(todo);
//         //context.readTodoCubit.changeTodoStatus(todo);
//         context.readTodoBloc.add(TodoStatusUpdateEvent(todo));
//       },
//       child: SizedBox(
//           width: 50,
//           height: 50,
//           child: switch (todo.status) {
//             TodoStatus.complete => Checkbox(
//                 value: true,
//                 onChanged: null,
//                 fillColor: WidgetStateProperty.all(
//                   context.appColors.checkBoxColor,
//                 ),
//               ),
//             TodoStatus.incomplete => const Checkbox(
//                 value: false,
//                 onChanged: null,
//               ),
//             TodoStatus.ongoing => const Fire()
//           }),
//     );
//   }
// }
