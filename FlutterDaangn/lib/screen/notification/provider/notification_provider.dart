import 'package:flutter_daangn/data/network/daangn_api.dart';
import 'package:flutter_daangn/screen/notification/vo/vo_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteNotificationProvider = FutureProvider((ref) async {
  final result = await DaangnApi.getNotification();
  return result.successData;
});

final notificationProvider = StateProvider<List<DaangnNotification>?>((ref) {
  final list = ref.watch(remoteNotificationProvider);
  if (list.hasValue) {
    return list.requireValue;
  }
  return null;
});
