/// 1

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

/// @nodoc
mixin _$Todo {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_time')
  DateTime get createdTime => throw _privateConstructorUsedError;
  DateTime? get modifyTime => throw _privateConstructorUsedError;
  set modifyTime(DateTime? value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  set dueDate(DateTime value) => throw _privateConstructorUsedError;
  TodoStatus get status => throw _privateConstructorUsedError;
  set status(TodoStatus value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
  _$TodoCopyWithImpl<$Res, Todo>;
  @useResult
  $Res call(
      {int id,
        @JsonKey(name: 'created_time') DateTime createdTime,
        DateTime? modifyTime,
        String title,
        DateTime dueDate,
        TodoStatus status});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res, $Val extends Todo>
    implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdTime = null,
    Object? modifyTime = freezed,
    Object? title = null,
    Object? dueDate = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
      as int,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
      as DateTime,
      modifyTime: freezed == modifyTime
          ? _value.modifyTime
          : modifyTime // ignore: cast_nullable_to_non_nullable
      as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
      as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
      as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
      as TodoStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$$_TodoCopyWith(_$_Todo value, $Res Function(_$_Todo) then) =
  __$$_TodoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
        @JsonKey(name: 'created_time') DateTime createdTime,
        DateTime? modifyTime,
        String title,
        DateTime dueDate,
        TodoStatus status});
}

/// @nodoc
class __$$_TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res, _$_Todo>
    implements _$$_TodoCopyWith<$Res> {
  __$$_TodoCopyWithImpl(_$_Todo _value, $Res Function(_$_Todo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdTime = null,
    Object? modifyTime = freezed,
    Object? title = null,
    Object? dueDate = null,
    Object? status = null,
  }) {
    return _then(_$_Todo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
      as int,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
      as DateTime,
      modifyTime: freezed == modifyTime
          ? _value.modifyTime
          : modifyTime // ignore: cast_nullable_to_non_nullable
      as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
      as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
      as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
      as TodoStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Todo extends _Todo with DiagnosticableTreeMixin {
  _$_Todo(
      {required this.id,
        @JsonKey(name: 'created_time') required this.createdTime,
        this.modifyTime,
        required this.title,
        required this.dueDate,
        this.status = TodoStatus.unknown})
      : super._();

  factory _$_Todo.fromJson(Map<String, dynamic> json) => _$$_TodoFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_time')
  final DateTime createdTime;
  @override
  DateTime? modifyTime;
  @override
  String title;
  @override
  DateTime dueDate;
  @override
  @JsonKey()
  TodoStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo(id: $id, createdTime: $createdTime, modifyTime: $modifyTime, title: $title, dueDate: $dueDate, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdTime', createdTime))
      ..add(DiagnosticsProperty('modifyTime', modifyTime))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('dueDate', dueDate))
      ..add(DiagnosticsProperty('status', status));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoCopyWith<_$_Todo> get copyWith =>
      __$$_TodoCopyWithImpl<_$_Todo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoToJson(
      this,
    );
  }
}

abstract class _Todo extends Todo {
  factory _Todo(
      {required final int id,
        @JsonKey(name: 'created_time') required final DateTime createdTime,
        DateTime? modifyTime,
        required String title,
        required DateTime dueDate,
        TodoStatus status}) = _$_Todo;
  _Todo._() : super._();

  factory _Todo.fromJson(Map<String, dynamic> json) = _$_Todo.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_time')
  DateTime get createdTime;
  @override
  DateTime? get modifyTime;
  set modifyTime(DateTime? value);
  @override
  String get title;
  set title(String value);
  @override
  DateTime get dueDate;
  set dueDate(DateTime value);
  @override
  TodoStatus get status;
  set status(TodoStatus value);
  @override
  @JsonKey(ignore: true)
  _$$_TodoCopyWith<_$_Todo> get copyWith => throw _privateConstructorUsedError;
}


/// 2

// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
//
// part of 'vo_todo.dart';
//
// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************
//
// T _$identity<T>(T value) => value;
//
// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');
//
// /// @nodoc
// mixin _$Todo {
//   int get id => throw _privateConstructorUsedError;
//   String get title => throw _privateConstructorUsedError;
//   DateTime get dueDate => throw _privateConstructorUsedError;
//   DateTime? get modifyTime => throw _privateConstructorUsedError;
//   DateTime get createdTime => throw _privateConstructorUsedError;
//   TodoStatus get status => throw _privateConstructorUsedError;
//
//   @JsonKey(ignore: true)
//   $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
// }
//
// /// @nodoc
// abstract class $TodoCopyWith<$Res> {
//   factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
//       _$TodoCopyWithImpl<$Res, Todo>;
//   @useResult
//   $Res call(
//       {int id,
//       String title,
//       DateTime dueDate,
//       DateTime? modifyTime,
//       DateTime createdTime,
//       TodoStatus status});
// }
//
// /// @nodoc
// class _$TodoCopyWithImpl<$Res, $Val extends Todo>
//     implements $TodoCopyWith<$Res> {
//   _$TodoCopyWithImpl(this._value, this._then);
//
//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;
//
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? id = null,
//     Object? title = null,
//     Object? dueDate = null,
//     Object? modifyTime = freezed,
//     Object? createdTime = null,
//     Object? status = null,
//   }) {
//     return _then(_value.copyWith(
//       id: null == id
//           ? _value.id
//           : id // ignore: cast_nullable_to_non_nullable
//               as int,
//       title: null == title
//           ? _value.title
//           : title // ignore: cast_nullable_to_non_nullable
//               as String,
//       dueDate: null == dueDate
//           ? _value.dueDate
//           : dueDate // ignore: cast_nullable_to_non_nullable
//               as DateTime,
//       modifyTime: freezed == modifyTime
//           ? _value.modifyTime
//           : modifyTime // ignore: cast_nullable_to_non_nullable
//               as DateTime?,
//       createdTime: null == createdTime
//           ? _value.createdTime
//           : createdTime // ignore: cast_nullable_to_non_nullable
//               as DateTime,
//       status: null == status
//           ? _value.status
//           : status // ignore: cast_nullable_to_non_nullable
//               as TodoStatus,
//     ) as $Val);
//   }
// }
//
// /// @nodoc
// abstract class _$$TodoImplCopyWith<$Res> implements $TodoCopyWith<$Res> {
//   factory _$$TodoImplCopyWith(
//           _$TodoImpl value, $Res Function(_$TodoImpl) then) =
//       __$$TodoImplCopyWithImpl<$Res>;
//   @override
//   @useResult
//   $Res call(
//       {int id,
//       String title,
//       DateTime dueDate,
//       DateTime? modifyTime,
//       DateTime createdTime,
//       TodoStatus status});
// }
//
// /// @nodoc
// class __$$TodoImplCopyWithImpl<$Res>
//     extends _$TodoCopyWithImpl<$Res, _$TodoImpl>
//     implements _$$TodoImplCopyWith<$Res> {
//   __$$TodoImplCopyWithImpl(_$TodoImpl _value, $Res Function(_$TodoImpl) _then)
//       : super(_value, _then);
//
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? id = null,
//     Object? title = null,
//     Object? dueDate = null,
//     Object? modifyTime = freezed,
//     Object? createdTime = null,
//     Object? status = null,
//   }) {
//     return _then(_$TodoImpl(
//       id: null == id
//           ? _value.id
//           : id // ignore: cast_nullable_to_non_nullable
//               as int,
//       title: null == title
//           ? _value.title
//           : title // ignore: cast_nullable_to_non_nullable
//               as String,
//       dueDate: null == dueDate
//           ? _value.dueDate
//           : dueDate // ignore: cast_nullable_to_non_nullable
//               as DateTime,
//       modifyTime: freezed == modifyTime
//           ? _value.modifyTime
//           : modifyTime // ignore: cast_nullable_to_non_nullable
//               as DateTime?,
//       createdTime: null == createdTime
//           ? _value.createdTime
//           : createdTime // ignore: cast_nullable_to_non_nullable
//               as DateTime,
//       status: null == status
//           ? _value.status
//           : status // ignore: cast_nullable_to_non_nullable
//               as TodoStatus,
//     ));
//   }
// }
//
// /// @nodoc
//
// class _$TodoImpl with DiagnosticableTreeMixin implements _Todo {
//   const _$TodoImpl(
//       {required this.id,
//       required this.title,
//       required this.dueDate,
//       this.modifyTime,
//       required this.createdTime,
//       required this.status});
//
//   @override
//   final int id;
//   @override
//   final String title;
//   @override
//   final DateTime dueDate;
//   @override
//   final DateTime? modifyTime;
//   @override
//   final DateTime createdTime;
//   @override
//   final TodoStatus status;
//
//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'Todo(id: $id, title: $title, dueDate: $dueDate, modifyTime: $modifyTime, createdTime: $createdTime, status: $status)';
//   }
//
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(DiagnosticsProperty('type', 'Todo'))
//       ..add(DiagnosticsProperty('id', id))
//       ..add(DiagnosticsProperty('title', title))
//       ..add(DiagnosticsProperty('dueDate', dueDate))
//       ..add(DiagnosticsProperty('modifyTime', modifyTime))
//       ..add(DiagnosticsProperty('createdTime', createdTime))
//       ..add(DiagnosticsProperty('status', status));
//   }
//
//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$TodoImpl &&
//             (identical(other.id, id) || other.id == id) &&
//             (identical(other.title, title) || other.title == title) &&
//             (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
//             (identical(other.modifyTime, modifyTime) ||
//                 other.modifyTime == modifyTime) &&
//             (identical(other.createdTime, createdTime) ||
//                 other.createdTime == createdTime) &&
//             (identical(other.status, status) || other.status == status));
//   }
//
//   @override
//   int get hashCode => Object.hash(
//       runtimeType, id, title, dueDate, modifyTime, createdTime, status);
//
//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$TodoImplCopyWith<_$TodoImpl> get copyWith =>
//       __$$TodoImplCopyWithImpl<_$TodoImpl>(this, _$identity);
// }
//
// abstract class _Todo implements Todo {
//   const factory _Todo(
//       {required final int id,
//       required final String title,
//       required final DateTime dueDate,
//       final DateTime? modifyTime,
//       required final DateTime createdTime,
//       required final TodoStatus status}) = _$TodoImpl;
//
//   @override
//   int get id;
//   @override
//   String get title;
//   @override
//   DateTime get dueDate;
//   @override
//   DateTime? get modifyTime;
//   @override
//   DateTime get createdTime;
//   @override
//   TodoStatus get status;
//   @override
//   @JsonKey(ignore: true)
//   _$$TodoImplCopyWith<_$TodoImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }
