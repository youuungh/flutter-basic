import 'package:flutter_todo/common/common.dart';
import 'package:flutter_todo/screen/main/tab/search/f_search.dart';
import 'package:flutter_todo/screen/main/tab/todo/f_todo.dart';
import 'package:flutter/material.dart';

enum TabItem {
  todo(Icons.event_note_outlined, 'Todo', TodoFragment()),
  search(Icons.search, 'Search', SearchFragment());

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage, {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context, {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color:
              isActivated ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
        ),
        label: tabName);
  }
}
