import 'package:flutter/foundation.dart';
import 'package:flutter_todo/data/local/collection/todo_db_model.dart';
import 'package:flutter_todo/data/memory/todo_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_todo.freezed.dart';
part 'vo_todo.g.dart';

/// 1

@unfreezed
class Todo with _$Todo{

  Todo._();

  factory Todo({
    required final int id,
    @JsonKey(name: 'created_time')required final DateTime createdTime,
    DateTime? modifyTime,
    required String title,
    required DateTime dueDate,
    @Default(TodoStatus.unknown) TodoStatus status,
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);

  TodoDbModel get dbModel => TodoDbModel(id, createdTime, modifyTime, title, dueDate, status);
}

/// 2

// @JsonSerializable()
// class Todo {
//   Todo({
//     required this.id,
//     required this.title,
//     required this.dueDate,
//     this.modifyTime,
//     TodoStatus? status,
//     DateTime? createdTime,
//   })  : createdTime = createdTime ?? DateTime.now(),
//         status = status ?? TodoStatus.incomplete;
//
//   int id;
//   String title;
//   final DateTime createdTime;
//   DateTime? modifyTime;
//   DateTime dueDate;
//   TodoStatus status;
//
//   factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
//
//   factory Todo.fromDB(TodoDbModel e) {
//     return Todo(
//         id: e.id,
//         title: e.title,
//         dueDate: e.dueDate,
//         createdTime: e.createdTime,
//         status: e.status,
//         modifyTime: e.modifyTime);
//   }
//
//   TodoDbModel toDbModel() => TodoDbModel(id, createdTime, modifyTime, title, dueDate, status);
//
//   Map<String, dynamic> toJson() => _$TodoToJson(this);
// }

/// Cubit

// @freezed
// class Todo with _$Todo {
//   const factory Todo({
//     required int id,
//     required String title,
//     required DateTime dueDate,
//     DateTime? modifyTime,
//     required DateTime createdTime,
//     required TodoStatus status,
//   }) = _Todo;
// }

/// Default

// class Todo {
//   Todo({
//     required this.id,
//     required this.title,
//     required this.dueDate,
//     this.status = TodoStatus.incomplete,
//   }) : createdTime = DateTime.now();
//
//   int id;
//   String title;
//   final DateTime createdTime;
//   DateTime? modifyTime;
//   DateTime dueDate;
//   TodoStatus status;
// }
