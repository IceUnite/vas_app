import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListItems extends StatelessWidget {
  final List<Widget> children;
  final Duration duration;
  final double verticalOffset;

  const AnimatedListItems({
    Key? key,
    required this.children,
    this.duration = const Duration(milliseconds: 600),
    this.verticalOffset = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        children: children.toStaggeredListWithDelay(
          duration: duration,
          verticalOffset: verticalOffset,
        ),
      ),
    );
  }
}

extension ToStaggeredListWithDelay on List<Widget> {
  List<Widget> toStaggeredListWithDelay({
    required Duration duration,
    double verticalOffset = 50.0,
  }) {
    return mapIndexed((index, child) {
      return AnimationConfiguration.staggeredList(
        position: index,
        duration: duration,
        child: SlideAnimation(
          verticalOffset: verticalOffset,
          curve: Curves.easeOut,
          child: FadeInAnimation(
            duration: duration,
            child: child,
          ),
        ),
      );
    }).toList();
  }

  Iterable<T> mapIndexed<T>(T Function(int index, Widget element) f) sync* {
    for (var i = 0; i < length; i++) {
      yield f(i, this[i]);
    }
  }
}
