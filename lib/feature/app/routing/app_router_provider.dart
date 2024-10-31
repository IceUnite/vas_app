
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouterProvider extends InheritedWidget {
  /// Constructs an [AppRouterProvider].
  const AppRouterProvider({
    required Widget child,
    required this.goRouter,
    Key? key,
  }) : super(child: child, key: key);

  /// The [GoRouter] instance used for this application.
  final GoRouter goRouter;

  @override
  bool updateShouldNotify(covariant AppRouterProvider oldWidget) {
    return false;
  }

  /// Find the current GoRouter in the widget tree.
  static GoRouter of(BuildContext context) {
    final AppRouterProvider? inherited =
        context.dependOnInheritedWidgetOfExactType<AppRouterProvider>();
    assert(inherited != null, 'No GoRouter found in context');
    return inherited!.goRouter;
  }
}