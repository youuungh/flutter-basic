import 'package:flutter_daangn/common/cli_common.dart';
import 'package:flutter_daangn/common/common.dart';
import 'package:flutter_daangn/entity/dummies.dart';
import 'package:flutter_daangn/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daangn/screen/main/tab/home/provider/post_provider.dart';
import 'package:flutter_daangn/screen/main/tab/home/w_product_post_item.dart';
import 'package:flutter_daangn/screen/notification/s_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../fab/w_floating_daangn_button.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {
  final scrollController = ScrollController();
  String title = "나의동";
  bool isMenuOpen = false;

  @override
  void initState() {
    scrollController.addListener(() {
      final floatingState = ref.read(floatingButtonStateProvider);

      if (scrollController.position.pixels > 100 && !floatingState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(true);
      } else if (scrollController.position.pixels < 100 &&
          floatingState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return ListView.separated(
    //   controller: scrollController,
    //   itemBuilder: (context, index) => ProductPostItem(postList[index]),
    //   itemCount: postList.length,
    //   separatorBuilder: (context, index) => const Line().pSymmetric(h: 16),
    // );

    final postList = ref.watch(postProvider);

    return Column(
      children: [
        AppBar(
          elevation: 0,
          title: PopupMenuButton<String>(
            offset: const Offset(0, 40),
            onSelected: (value) {
              setState(() {
                title = value;
                isMenuOpen = false;
              });
            },
            onOpened: () {
              setState(() {
                isMenuOpen = true;
              });
            },
            onCanceled: () {
              setState(() {
                isMenuOpen = false;
              });
            },
            itemBuilder: (BuildContext context) => ["1동", "2동"]
                .map((e) => PopupMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title),
                AnimatedRotation(
                  turns: isMenuOpen ? 0.5 : 0,
                  duration: 300.ms,
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                //Nav.push(NotificationScreen());
                context.go('/notification');
              },
              icon: Icon(Icons.notifications_none_rounded),
            )
          ],
          //automaticallyImplyLeading: false,
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: FloatingDaangnButton.height),
            controller: scrollController,
            itemBuilder: (context, index) => ProductPostItem(postList[index]),
            itemCount: postList.length,
            separatorBuilder: (context, index) =>
                const Line(color: Colors.white10).pSymmetric(h: 10),
          ),
        ),
      ],
    );
  }
}
