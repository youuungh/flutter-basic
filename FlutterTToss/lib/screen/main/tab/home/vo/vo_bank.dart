import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_bank.freezed.dart';

// class Bank{
//   final String name;
//   final String logoImagePath;
//
//   Bank(this.name, this.logoImagePath);
// }

@freezed
class Bank with _$Bank {
  factory Bank(
      final String name,
      final String logoImagePath,
      ) = _Bank;
}