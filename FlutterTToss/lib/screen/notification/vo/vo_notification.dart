import 'package:flutter_ttoss/screen/notification/vo/notification_type.dart';

class TtossNotification {
  final NotificationType type;
  final String description;
  final DateTime time;
  bool isRead;

  TtossNotification(
    this.type,
    this.description,
    this.time, {
    this.isRead = false,
  });
}
