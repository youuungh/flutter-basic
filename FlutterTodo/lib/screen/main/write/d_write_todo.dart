import 'package:after_layout/after_layout.dart';
import 'package:flutter_todo/common/common.dart';
import 'package:flutter_todo/common/dart/extension/datetime_extension.dart';
import 'package:flutter_todo/common/util/app_keyboard_util.dart';
import 'package:flutter_todo/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:flutter_todo/common/widget/w_round_button.dart';
import 'package:flutter_todo/screen/main/write/vo_write_to_result.dart';
import 'package:flutter/material.dart';
import 'package:nav_hooks/dialog/dialog.dart';
import 'package:nav_hooks/dialog/hook_consumer_dialog.dart';
import 'package:nav_hooks/dialog/hook_dialog.dart';

import '../../../common/hooks/use_focused.dart';
import '../../../common/hooks/use_second_timer.dart';
import '../../../common/hooks/use_show_keyboard.dart';
import '../../../common/widget/w_empty_expanded.dart';
import '../../../common/widget/w_rounded_container.dart';
import '../../../data/memory/vo_todo.dart';
import '../../../data/memory/vo_todo_write_result.dart';
import '../../../data/simple_result.dart';

class WriteTodoBottomSheet extends DialogWidget<SimpleResult<TodoWriteResult, void>> {
  final Todo? todoForEdit;

  WriteTodoBottomSheet({
    super.context,
    super.key,
    super.barrierColor = const Color(0x80000000),
    super.animation = NavAni.Bottom,
    super.useRootNavigator = false,
    this.todoForEdit,
  });

  @override
  State<StatefulWidget> createState() => _WriteTodoBottomSheetState();
}

class _WriteTodoBottomSheetState extends DialogState<WriteTodoBottomSheet> with AfterLayoutMixin {
  final todoTextEditingController = TextEditingController();
  final node = FocusNode();
  late DateTime _selectedDate;
  bool showRedTextLine = false;

  @override
  void initState() {
    final todoForEdit = widget.todoForEdit;
    if (todoForEdit != null) {
      _selectedDate = todoForEdit.dueDate;
      todoTextEditingController.text = todoForEdit.title;
    } else {
      _selectedDate = DateTime.now();
    }
    super.initState();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    AppKeyboardUtil.show(context, node);
  }

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
      body: Column(
        children: [
          Row(
            children: [
              '할일을 작성해주세요.'.text.size(18).bold.make(),
              emptyExpanded,
              Tap(
                onTap: onTapChangedDate,
                child: _selectedDate.formattedDate.text.make(),
              ),
              IconButton(
                padding: const EdgeInsets.all(15),
                onPressed: onTapChangedDate,
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),
          const Height(20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  focusNode: node,
                  controller: todoTextEditingController,
                  decoration: InputDecoration(
                    focusedBorder: !showRedTextLine
                        ? null
                        : const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                  onEditingComplete: () => done(context),
                ),
              ),
              RoundButton(
                  text: isEditMode ? '수정' : '추가',
                  onTap: () {
                    done(context);
                  })
            ],
          )
        ],
      ),
    );
  }

  bool get isEditMode => widget.todoForEdit != null;

  void onTapChangedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        helpText: '목표일을 선택해주세요.',
        initialDate: _selectedDate,
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now().add(const Duration(days: 365 * 10)));
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  void done(BuildContext context) {
    if (todoTextEditingController.text.trim().isEmpty) {
      setState(() {
        showRedTextLine = true;
      });
      return;
    }

    widget.hide(SimpleResult.success(
        TodoWriteResult(title: todoTextEditingController.text, dueDate: _selectedDate)));
  }
}

/// Riverpod hooks

// class WriteTodoDialog extends HookDialogWidget<WriteTodoResult> {
//   final Todo? todoForEdit;
//
//   WriteTodoDialog({this.todoForEdit, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final selectedDate = useState<DateTime>(DateTime.now());
//     final textController = useTextEditingController();
//     final textController2 = useTextEditingController();
//
//     useMemoized(() {
//       if (todoForEdit != null) {
//         selectedDate.value = todoForEdit!.dueDate;
//         textController.text = todoForEdit!.title;
//       }
//     });
//
//     final node = useFocusNode();
//     final node2 = useFocusNode();
//
//     showKeyboard(node);
//
//     final isOneFocused = useIsFocused(node);
//     final isTwoFocused = useIsFocused(node2);
//     final secondTime = useTimerSecond();
//
//     //final onSelectDate = useOnSelectDate(context, selectedDate);
//
//     return BottomDialogScaffold(
//         body: RoundedContainer(
//       padding: const EdgeInsets.all(20),
//       color: isOneFocused
//           ? AppColors.faleBlue
//           : isTwoFocused
//               ? AppColors.salmon
//               : AppColors.grey,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               '할일을 작성해주세요 $secondTime'.text.size(15).bold.make(),
//               spacer,
//               selectedDate.value.formattedDate.text.make(),
//               IconButton(
//                   onPressed: () => _selectDate(context, selectedDate),
//                   //onSelectDate, //_selectDate(context, selectedDate)
//                   icon: const Icon(Icons.calendar_month))
//             ],
//           ),
//           height20,
//           Row(
//             children: [
//               Expanded(
//                   child: TextField(
//                 focusNode: node,
//                 controller: textController,
//               )),
//               RoundButton(
//                   text: isEditMode ? '완료' : '추가',
//                   onTap: () {
//                     hide(WriteTodoResult(
//                         selectedDate.value, textController.text));
//                   })
//             ],
//           )
//         ],
//       ),
//     ));
//   }
//
//   // void Function() useOnSelectDate(
//   //     BuildContext context, ValueNotifier<DateTime> selectedDate) {
//   //   final onSelectDate = useCallback(() async {
//   //     final date = await showDatePicker(
//   //         context: context,
//   //         initialDate: selectedDate.value,
//   //         firstDate: DateTime.now().subtract(const Duration(days: 365)),
//   //         lastDate: DateTime.now().add(const Duration(days: 365 * 10)));
//   //
//   //     if (date != null) {
//   //       selectedDate.value = date;
//   //     }
//   //   });
//   //   return onSelectDate;
//   // }
//
//   bool get isEditMode => todoForEdit != null;
//
//   void _selectDate(
//       BuildContext context, ValueNotifier<DateTime> selectedDate) async {
//     final date = await showDatePicker(
//         context: useContext(),
//         initialDate: selectedDate.value,
//         firstDate: DateTime.now().subtract(const Duration(days: 365)),
//         lastDate: DateTime.now().add(const Duration(days: 365 * 10)));
//     if (date != null) {
//       selectedDate.value = date;
//     }
//   }
// }

/// Default

// class WriteTodoDialog extends DialogWidget<WriteTodoResult> {
//   final Todo? todoForEdit;
//
//   WriteTodoDialog({this.todoForEdit, super.key});
//
//   @override
//   DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
// }
//
// class _WriteTodoDialogState extends DialogState<WriteTodoDialog>
//     with AfterLayoutMixin {
//   DateTime _selectedDate = DateTime.now();
//   final textController = TextEditingController();
//   final node = FocusNode();
//
//   @override
//   void initState() {
//     if (widget.todoForEdit != null) {
//       _selectedDate = widget.todoForEdit!.dueDate;
//       textController.text = widget.todoForEdit!.title;
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomDialogScaffold(
//       body: RoundedContainer(
//           color: context.backgroundColor,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   '할일을 작성해주세요'.text.size(18).bold.make(),
//                   spacer,
//                   _selectedDate.formattedDate.text.make(),
//                   IconButton(
//                       onPressed: _selectDate,
//                       icon: const Icon(Icons.calendar_month))
//                 ],
//               ),
//               height20,
//               Row(
//                 children: [
//                   Expanded(
//                       child: TextField(
//                     focusNode: node,
//                     controller: textController,
//                   )),
//                   RoundButton(
//                       text: isEditMode ? '완료' : '추가',
//                       onTap: () {
//                         widget.hide(WriteTodoResult(
//                             _selectedDate, textController.text));
//                       }),
//                 ],
//               )
//             ],
//           )),
//     );
//   }
//
//   bool get isEditMode => widget.todoForEdit != null;
//
//   void _selectDate() async {
//     final date = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime.now().subtract(const Duration(days: 365)),
//       lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
//     );
//     if (date != null) {
//       setState(() {
//         _selectedDate = date;
//       });
//     }
//   }
//
//   @override
//   FutureOr<void> afterFirstLayout(BuildContext context) {
//     AppKeyboardUtil.show(context, node);
//   }
// }
