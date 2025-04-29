// ignore_for_file: use_build_context_synchronously

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_colors.dart';
import '../theme/typography.dart';
import 'package:vas_app/core/theme/theme_notifier.dart';

class ApeironSpaceDialog extends StatelessWidget {
  const ApeironSpaceDialog({
    super.key,
    this.title,
    this.message,
    this.confirmText,
    this.onConfirmTap,
    this.closeText,
    this.content,
    this.onCloseTap,
    this.showTextField = false,
    this.textFieldController,
  });

  final String? title;
  final String? message;
  final String? confirmText;
  final VoidCallback? onConfirmTap;
  final String? closeText;
  final VoidCallback? onCloseTap;
  final Widget? content;
  final bool showTextField;
  final TextEditingController? textFieldController;

  static final Queue<_DialogQueueData> _queue = Queue<_DialogQueueData>();

  static void _safeCall(VoidCallback? callback) {
    if (callback != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        callback();
      });
    }
  }

  static Future<void> _handleDialogQueue({
    required BuildContext context,
    required WidgetBuilder builder,
    bool dismissible = true,
    String? idToCompare,
  }) async {
    Future<void> callback() async {
      await showDialog<void>(
        context: context,
        barrierColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black.withOpacity(.8)
            : AppColors.orange200.withOpacity(.3),
        barrierDismissible: dismissible,
        builder: builder,
      );

      if (_queue.isNotEmpty) {
        _queue.removeFirst();
      }

      if (_queue.isNotEmpty) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
        _queue.first.callback();
      }
    }

    if (_queue.isEmpty) {
      _queue.add(_DialogQueueData(callback: callback, idToCompare: idToCompare));
      await callback();
    } else {
      if (idToCompare != null && _queue.last.idToCompare != idToCompare) {
        _queue.add(_DialogQueueData(callback: callback, idToCompare: idToCompare));
      }
    }
  }

  static void showActionDialog(
    BuildContext context, {
    required String title,
    required VoidCallback onPressedConfirm,
    required VoidCallback onPressedClosed,
    String? message,
    String? confirmText,
    String? closeText,
    bool dismissible = true,
    bool showTextField = false,
    TextEditingController? textFieldController,
  }) {
    _handleDialogQueue(
      context: context,
      dismissible: dismissible,
      builder: (BuildContext context) {
        return ApeironSpaceDialog(
          title: title,
          message: message,
          confirmText: confirmText ?? "go",
          closeText: closeText,
          onConfirmTap: () {
            Navigator.of(context).pop();
            _safeCall(onPressedConfirm);
          },
          onCloseTap: () {
            Navigator.of(context).pop();
            _safeCall(onPressedClosed);
          },
          showTextField: showTextField,
          textFieldController: textFieldController,
        );
      },
    );
  }

  static void clearAll(BuildContext context) {
    final bool hasClean = _queue.isNotEmpty;
    _queue.clear();

    if (hasClean) {
      Future<void>.delayed(const Duration(milliseconds: 200)).then((_) {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness;
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      final isDarkTheme = themeNotifier.isDarkTheme;
      return Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            left: 16,
            right: 16,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: (screenWidth - 400) / 2 > 0 ? (screenWidth - 400) / 2 : 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme == Brightness.dark ? AppColors.gray.shade90 : AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (title != null)
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: AppTypography.font20Regular.copyWith(fontWeight: FontWeight.w700),
                  ),
                const SizedBox(height: 12),
                if (message != null)
                  Text(
                    message!,
                    style: AppTypography.font20Regular.copyWith(color: AppColors.black),
                    textAlign: TextAlign.center,
                  ),
                if (showTextField) ...[
                  const SizedBox(height: 20),
                  Material(
                    color: isDarkTheme ? AppColors.gray.shade90 : Colors.white,
                    child: TextField(
                      controller: textFieldController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "в ООО 'ЛЕГ'",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        filled: true,
                        fillColor: isDarkTheme ? Colors.grey.shade700 : Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.white,
                    backgroundColor: theme == Brightness.dark
                        ? AppColors.green300.withOpacity(0.8)
                        : AppColors.green200.withOpacity(0.8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  ),
                  onPressed: onConfirmTap,
                  child: Text(
                    confirmText ?? 'Подтвердить',
                    style: AppTypography.font16Regular.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                if (closeText != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.red.withOpacity(0.8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    ),
                    onPressed: onCloseTap,
                    child: Text(
                      closeText!,
                      style: AppTypography.font16Regular.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _DialogQueueData {
  const _DialogQueueData({
    required this.callback,
    required this.idToCompare,
  });

  final Future<void> Function() callback;
  final String? idToCompare;
}
