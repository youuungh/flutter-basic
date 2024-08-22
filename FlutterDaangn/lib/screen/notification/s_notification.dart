import 'package:flutter/material.dart';
import 'package:flutter_daangn/common/common.dart';
import 'package:flutter_daangn/screen/notification/f_notification_list.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationEditModeProvider = StateProvider((ref) => false);

class NotificationScreen extends HookConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    final isEditMode = ref.watch(notificationEditModeProvider);
    return Material(
      child: Column(
        children: [
          AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                context.go('/');
              },
            ),
            title: '알림'.text.make(),
            actions: [
              Tap(
                onTap: () {
                  ref.read(notificationEditModeProvider.notifier).state =
                      !isEditMode;
                },
                child: (isEditMode ? '완료' : '편집').text.make().p(10),
              )
            ],
          ),
          TabBar(
            controller: tabController,
            tabs: ['활동 알림'.text.white.make(), '키워드 알림'.text.white.make()],
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelPadding: const EdgeInsets.symmetric(vertical: 20),
            indicatorColor: Colors.white,
          ),
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: [
              NotificationFragment(),
              Container(
                color: Colors.grey,
              )
            ],
          ))
        ],
      ),
    );
  }
}
