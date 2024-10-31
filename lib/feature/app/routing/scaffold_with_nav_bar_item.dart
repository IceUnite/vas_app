import 'package:flutter/material.dart';

/// Representation of a tab item in a [ScaffoldWithNavBar]
class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  /// Constructs an [ScaffoldWithNavBarTabItem].
  const ScaffoldWithNavBarTabItem({
    required this.rootRoutePath,
    Widget? iconActive,
    required Widget icon,
    String? label,
  }) : super(
          icon: icon,
          label: label,
          activeIcon: iconActive,
        );

  /// The initial location/path
  final String rootRoutePath;
}
