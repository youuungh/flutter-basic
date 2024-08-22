import 'package:flutter_daangn/common/common.dart';

enum NotificationType {
  official('$basePath/notification/notification_icon_01.png'),
  legal('$basePath/notification/notification_icon_02.png'),
  local('$basePath/notification/notification_icon_03.png');

  const NotificationType(this.iconPath);

  final String iconPath;
}