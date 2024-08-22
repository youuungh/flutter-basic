import 'package:daangn_ui/widget/animated_width_collapse.dart';
import 'package:flutter_daangn/common/cli_common.dart';
import 'package:flutter_daangn/common/common.dart';
import 'package:flutter_daangn/screen/main/fab/w_floating_daangn_button.riverpod.dart';
import 'package:flutter_daangn/screen/main/s_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daangn/screen/write/s_write.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/language/language.dart';


class FloatingDaangnButton extends ConsumerWidget {
  static const height = 120.0;

  FloatingDaangnButton({super.key});

  final duration = 300.ms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingButtonState = ref.watch(floatingButtonStateProvider);
    final isExpanded = floatingButtonState.isExpanded;
    final isSmall = floatingButtonState.isSmall;
    final isHided = floatingButtonState.isHided;

    return AnimatedOpacity(
      opacity: isHided? 0 : 1,
      duration: duration,
      child: Stack(
        children: [
          IgnorePointer(
            ignoring: !isExpanded,
            child: AnimatedContainer(
              duration: duration,
              color:
              isExpanded ? Colors.black.withOpacity(0.4) : Colors.transparent,
            ),
          ),
          IgnorePointer(
            ignoring: isHided,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IgnorePointer(
                      ignoring: !isExpanded,
                      child: AnimatedOpacity(
                        opacity: isExpanded ? 1 : 0,
                        duration: duration,
                        child: Column(
                          children: [
                            Container(
                              width: layerWidth,
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(right: 16, bottom: 4),
                              decoration: BoxDecoration(
                                  color: context.appColors.floatingActionLayer,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //_floatItem('알바', '$basePath/fab/fab_01.png'),
                                  Tap(
                                    onTap: () {
                                      context.go('/main/localLife');
                                    },
                                    child:
                                    _floatItem('part_time', '$basePath/fab/fab_01.png'),
                                  ),
                                  const SizedBox(height: 16),
                                  _floatItem('lecture', '$basePath/fab/fab_02.png'),
                                  const SizedBox(height: 16),
                                  _floatItem('agriculture', '$basePath/fab/fab_03.png'),
                                  const SizedBox(height: 16),
                                  _floatItem('profit', '$basePath/fab/fab_04.png'),
                                  const SizedBox(height: 16),
                                  _floatItem('car', '$basePath/fab/fab_05.png'),
                                ],
                              ),
                            ),
                            height4,
                            Tap(
                              onTap: () {
                                //Nav.push(const WriteScreen());
                                context.go('/write');
                              },
                              child: Container(
                                width: layerWidth,
                                padding: const EdgeInsets.all(12),
                                margin: const EdgeInsets.only(right: 16, bottom: 10),
                                decoration: BoxDecoration(
                                    color: context.appColors.floatingActionLayer,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _floatItem('내 물건 팔기', '$basePath/fab/fab_06.png')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tap(
                      onTap: () {
                        ref.read(floatingButtonStateProvider.notifier).toggleMenu();
                      },
                      child: AnimatedContainer(
                        duration: duration,
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            color: isExpanded
                                ? context.appColors.floatingActionLayer
                                : const Color(0xffff791f),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedRotation(
                                turns: isExpanded ? 0.125 : 0,
                                duration: duration,
                                child: const Icon(Icons.add)),
                            AnimatedContainer(
                              duration: duration,
                              width: !isSmall ? 8 : 0,
                            ),
                            AnimatedWidthCollapse(
                              visible: !isSmall,
                              duration: duration,
                              child: '글쓰기'.text.make(),
                            )
                          ],
                        ),
                      ),
                    ).pOnly(
                        bottom: MainScreenState.bottomNavigationBarHeight +
                            context.viewPaddingBottom +
                            16,
                        right: 16),
                  ],
                )),
          )
        ],
      ),
    );
  }

  double get layerWidth => currentLanguage == Language.english ? 250 : 160;

  _floatItem(String title, String imagePath) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 30,
        ),
        const Width(8),
        title.tr().text.make(),
      ],
    );
  }
}
