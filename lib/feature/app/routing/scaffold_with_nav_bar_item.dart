import 'package:flutter/material.dart';

/// Representation of a tab item in a [ScaffoldWithNavBar]
class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  /// Constructs an [ScaffoldWithNavBarTabItem].
  const ScaffoldWithNavBarTabItem({
    required this.rootRoutePath,
    Widget? iconActive,
    required Widget icon,
    String? label,
    // Color? backgroundColor,
  }) : super(
          icon: icon,
          label: label,
          activeIcon: iconActive,
    // backgroundColor: backgroundColor,
        );

  /// The initial location/path
  final String rootRoutePath;
}
