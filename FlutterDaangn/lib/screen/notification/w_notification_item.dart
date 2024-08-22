import 'package:flutter/material.dart';
import 'package:flutter_daangn/common/common.dart';
import 'package:flutter_daangn/screen/notification/provider/notification_provider.dart';
import 'package:flutter_daangn/screen/notification/s_notification.dart';
import 'package:flutter_daangn/screen/notification/vo/vo_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemWidget extends ConsumerStatefulWidget {
  final DaangnNotification notification;
  final VoidCallback onTap;

  const NotificationItemWidget(
      {super.key, required this.notification, required this.onTap});

  @override
  ConsumerState<NotificationItemWidget> createState() =>
      _NotificationItemWidgetState();
}

class _NotificationItemWidgetState
    extends ConsumerState<NotificationItemWidget> {
  static const leftPadding = 16.0;
  static const iconWidth = 30.0;

  @override
  Widget build(BuildContext context) {
    final isEditMode = ref.watch(notificationEditModeProvider);
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: widget.notification.isRead
            ? context.backgroundColor
            : context.appColors.unreadColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Width(leftPadding),
                Image.asset(
                  widget.notification.type.iconPath,
                  width: iconWidth,
                ),
                Expanded(child: widget.notification.title.text.bold.make()),
                if (isEditMode)
                  IconButton(
                      onPressed: () {
                        final list = ref.read(notificationProvider)!;
                        list.remove(widget.notification);
                        ref.read(notificationProvider.notifier).state =
                            List.of(list);
                      },
                      icon: Icon(Icons.delete))
              ],
            ),
            height10,
            widget.notification.description.text
                .color(context.appColors.lessImportant)
                .make()
                .pOnly(left: leftPadding + iconWidth),
            height10,
            timeago
                .format(widget.notification.time,
                    locale: context.locale.languageCode)
                .text
                .size(13)
                .color(context.appColors.lessImportant)
                .make()
                .pOnly(left: leftPadding + iconWidth)
          ],
        ),
      ),
    );
  }
}
