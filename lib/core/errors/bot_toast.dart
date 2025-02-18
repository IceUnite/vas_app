import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vas_app/core/widgets/toasts_and_alerts/confirm_alert.dart';
import 'package:vas_app/core/widgets/toasts_and_alerts/error_toast.dart';

@lazySingleton
class BotToastDi {
  void showNotification({
    required String title,
    Widget? icon,
  }) =>
      BotToast.showCustomNotification(
        duration: const Duration(seconds: 10),
        align: const Alignment(0, 0.94),
        wrapToastAnimation: (controller, cancel, Widget child) => CustomAnimationWidget(
          controller: controller,
          child: child,
        ),
        toastBuilder: (cancelFunc) => ErrorToast(
          onCancel: cancelFunc,
          label: title,
          icon: icon,
        ),
      );

  void showConfirmDialog({
    required String title,
    required String subTitle,
    required VoidCallback onConfirm,
    required BuildContext context,
    String? roomNumber,
    Widget? icon,
  }) {
    BotToast.showCustomNotification(
      duration: const Duration(hours: 5),
      align: const Alignment(0, 0),
      wrapToastAnimation: (controller, cancel, Widget child) => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          GestureDetector(
            onTap: cancel, // Закрывает при нажатии на фон
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white.withOpacity(0.7), // Полупрозрачный черный фон
            ),
          ),
          CustomAnimationWidget(
            controller: controller,
            child: child,
          ),
        ],
      ),
      toastBuilder: (cancelFunc) => ConfirmAlert(
        onCancel: cancelFunc,
        onConfirm: onConfirm,
        icon: icon,
        label: title,
      ),
    );
  }
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
      child: widget.child,
    );
  }
}
