import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/core/widgets/error_toast.dart';

@lazySingleton
class BotToastDi {
  void showNotification({
    required String title,
    Widget? icon,
  }) =>
      BotToast.showCustomNotification(
        duration: Duration(hours: 8),
        align: const Alignment(0, 0.94),
        wrapToastAnimation: (controller, cancel, Widget child) =>
            CustomAnimationWidget(
              controller: controller,
              child: child,
            ),
        toastBuilder: (cancelFunc) => ErrorToast(
          onCancel: cancelFunc,
          label: title,
          icon: icon,
        ),
      );

  // void showDeliveryDialog({
  //   required String title,
  //   required String subTitle,
  //   required VoidCallback onConfirm,
  //   String? roomNumber,
  //   Widget? icon,
  // }) =>
  //     BotToast.showCustomNotification(
  //       duration: Duration(days: 1),
  //       align: const Alignment(0, 0),
  //       wrapToastAnimation: (controller, cancel, Widget child) =>
  //           CustomAnimationWidget(
  //             controller: controller,
  //             child: child,
  //           ),
  //       toastBuilder: (cancelFunc) => DeliveryAlert(
  //         roomNumber: roomNumber,
  //         subTitle: subTitle,
  //         onConfirm: onConfirm,
  //         onCancel: cancelFunc, // Передайте функцию отмены в ваш кастомный алерт
  //         title: title, // Передайте заголовок в ваш кастомный алерт
  //         icon: icon, // Передайте иконку, если она есть
  //       ),
  //     );
}




class CustomAnimationWidget extends StatefulWidget {
  final AnimationController controller;
  final Widget child;

  const CustomAnimationWidget({
    Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  @override
  _CustomAnimationWidgetState createState() => _CustomAnimationWidgetState();
}

class _CustomAnimationWidgetState extends State<CustomAnimationWidget> {
  static final Tween<double> tweenScale = Tween<double>(begin: 0.7, end: 1.0);
  late Animation<double> animation;

  @override
  void initState() {
    animation = CurvedAnimation(
      parent: widget.controller,
      curve: Curves.decelerate,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: widget.child,
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: tweenScale.evaluate(animation),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
    );
  }
}



