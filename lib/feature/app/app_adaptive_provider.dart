import 'package:flutter/material.dart';

class AppAdaptiveProvider extends InheritedWidget {
  const AppAdaptiveProvider({
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  Size getHeight(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  DeviceSize deviceSize(BuildContext context) =>
      getHeight(context).height > 760
          ? DeviceSize.large
          : DeviceSize.small;

  static AppAdaptiveProvider of(BuildContext context) {
    final AppAdaptiveProvider? inherited =
        context.dependOnInheritedWidgetOfExactType<AppAdaptiveProvider>();
    assert(inherited != null, 'No AppAdaptiveProvider found in context');
    return inherited!;
  }

  @override
  bool updateShouldNotify(covariant AppAdaptiveProvider oldWidget) {
    return false;
  }
}

enum DeviceSize {
  small,
  large,
}
