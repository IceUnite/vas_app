import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';

class ApeironSpaceDialog extends StatelessWidget {
  const ApeironSpaceDialog({
    this.title,
    this.message,
    this.confirmText,
    this.onConfirmTap,
    this.closeText,
    this.content,
    this.onCloseTap,
  });

  final String? title;
  final String? message;
  final String? confirmText;
  final VoidCallback? onConfirmTap;
  final String? closeText;
  final VoidCallback? onCloseTap;
  final Widget? content;

  static final Queue<DialogQueueData> _queue = Queue<DialogQueueData>();
  static void showUnknownErrorDialog(BuildContext context) {
    showApiErrorDialog(
      outerContext: context,
      title: "errorSomethingWrong",
      message: "errorComeBackLater",
      showHelp: true,
    );
  }

  static void showPaymentErrorDialog(
      {required BuildContext context, String? title, String? message, String? confirmText}) {
    _handleDialogQueue(
        context: context,
        builder: (BuildContext context) {
          return ApeironSpaceDialog(
            title: title ?? "paymentError",
            message: message ?? "pleaseTryAgain",
            confirmText: confirmText ?? "toRetry",
            onConfirmTap: () => Navigator.of(context).pop(),
          );
        },
        idToCompare: 'showPaymentErrorDialog$title$message$confirmText');
  }

  static void showCardErrorDialog(BuildContext context, String title) {
    _handleDialogQueue(
        context: context,
        builder: (BuildContext context) {
          return ApeironSpaceDialog(
            title: title,
            message: "pleaseTryAgain",
            confirmText: "toRetry",
            onConfirmTap: () => Navigator.of(context).pop(),
          );
        },
        idToCompare: 'showCardErrorDialog$title');
  }

  // static void showConfirmDialog(BuildContext context, AlertDialogConfirmType typeDialog) {
  //   _handleDialogQueue(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return ApeironSpaceDialog(
  //           title: typeDialog.title,
  //           message: typeDialog.message,
  //           confirmText: typeDialog.textButton,
  //           onConfirmTap: () => Navigator.of(context).pop(),
  //         );
  //       }
  //   );
  // }

  static void showApiErrorDialog({
    required BuildContext outerContext,
    required String title,
    required String message,
    bool showHelp = false,
  }) {
    _handleDialogQueue(
        context: outerContext,
        builder: (BuildContext context) => ApeironSpaceDialog(
              title: title,
              message: message,
              confirmText: showHelp ? "contactTheHotel" : "ok",
              onConfirmTap: showHelp ? () => Navigator.of(context).pop() : () => Navigator.of(context).pop(),
              closeText: showHelp ? "ok" : null,
            ),
        idToCompare: 'showApiErrorDialog$title$message');
  }

  static void showApiErrorSmartDialog({
    required BuildContext outerContext,
    required String title,
    required String message,
    bool showHelp = false,
  }) {
    _handleDialogQueue(
        context: outerContext,
        builder: (BuildContext context) => ApeironSpaceDialog(
              title: title,
              message: message,
              confirmText: showHelp ? "contactTheHotel" : "ok",
              onConfirmTap: showHelp
                  ? () => null
                  : () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
              closeText: showHelp ? "ok" : null,
            ),
        idToCompare: 'showApiErrorSmartDialog$title$message');
  }

  static void showNoConnectionErrorDialog(BuildContext context) {
    showApiErrorDialog(
      outerContext: context,
      title: "noInternet",
      message: "errorLostConnectionToServer",
      showHelp: true,
    );
  }

  static void showSuccessDialog(BuildContext context, String title, String message, {String? confirmText}) {
    _handleDialogQueue(
        context: context,
        builder: (BuildContext context) {
          return ApeironSpaceDialog(
            title: title,
            message: message,
            confirmText: confirmText ?? "ok",
            onConfirmTap: () => Navigator.of(context).pop(),
            onCloseTap: () => Navigator.of(context).pop(),
          );
        });
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
    double? verticalMargin,
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
            onPressedConfirm.call();
          },
          onCloseTap: () {
            Navigator.of(context).pop();
            onPressedClosed.call();

          },
        );
      },
    );
  }

  static void showCustomDialog(
    BuildContext context,
    WidgetBuilder builder, {
    bool dismissible = true,
  }) {
    _handleDialogQueue(
      context: context,
      dismissible: dismissible,
      builder: (BuildContext sheetContext) {
        return Center(
          child: SingleChildScrollView(
            // physics: SuperBouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
              ),

              // ch_handleDialogQueue(
              //       context: context,
              //       dismissible: dismissible,
              //       builder: (BuildContext sheetContext) {
              //         return Center(
              //           child: SingleChildScrollView(
              //             // physics: SuperBouncingScrollPhysics(),
              //             child: Padding(
              //               padding: EdgeInsets.only(
              //                 bottom: MediaQuery.of(context).viewInsets.bottom,
              //                 left: 16,
              //                 right: 16,
              //               ),
              // child: Material(
              //   color: Colors.transparent,
              //   borderRadius: BorderRadius.circular(12),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //       vertical: 24,
              //       horizontal: 26,
              //     ),
              //     child: SizedBox(
              //       width: double.infinity,
              //       child: builder(sheetContext),
              //     ),
              //   ),
              // ),
              //             ),
              //           ),
              //         );
              //       },
              //     );ild: Material(
              //   color: Colors.transparent,
              //   borderRadius: BorderRadius.circular(12),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //       vertical: 24,
              //       horizontal: 26,
              //     ),
              //     child: SizedBox(
              //       width: double.infinity,
              //       child: builder(sheetContext),
              //     ),
              //   ),
              // ),
            ),
          ),
        );
      },
    );
  }

  static void showBreakfastDialog({
    required BuildContext context,
    required String? title,
    required String? message,
    required String? confirmText,
    required String? closeText,
  }) {
    _handleDialogQueue(
      context: context,
      builder: (BuildContext context) {
        return ApeironSpaceDialog(
          title: title,
          message: message,
          confirmText: confirmText ?? "ok",
          onConfirmTap: () {
            Navigator.of(context).pop();
          },
          closeText: closeText ?? "close",
        );
      },
    );
  }

  static void showChatDialog({
    required BuildContext context,
    required String? title,
    required String? message,
    required String? confirmText,
    required String? closeText,
    required Function() onConfirmTap,
    required Function() onCloseTap,
  }) {
    _handleDialogQueue(
      context: context,
      builder: (BuildContext context) {
        return ApeironSpaceDialog(
          title: title,
          message: message,
          confirmText: confirmText ?? "ok",
          onConfirmTap: onConfirmTap,
          closeText: closeText ?? "close",
          onCloseTap: onCloseTap,
        );
      },
    );
  }

  static void showFindBookingFailureDialog({
    required BuildContext context,
    required String? title,
    required String? message,
    required String? confirmText,
    required String? closeText,
    required Function() onConfirmTap,
    required Function() onCloseTap,
  }) {
    _handleDialogQueue(
        context: context,
        builder: (BuildContext context) {
          return ApeironSpaceDialog(
            title: title,
            message: message,
            confirmText: confirmText ?? "ok",
            onConfirmTap: onConfirmTap,
            closeText: closeText ?? "close",
            onCloseTap: onCloseTap,
          );
        },
        idToCompare: '$title$message$confirmText$closeText');
  }

  static void showSmartFailureDialog({
    required BuildContext context,
    required String? message,
    required String? confirmText,
    required String? closeText,
    required Function() onConfirmTap,
    required Function() onCloseTap,
  }) {
    _handleDialogQueue(
        context: context,
        builder: (BuildContext context) {
          return ApeironSpaceDialog(
            message: message,
            confirmText: confirmText ?? "context.loc.goToChat",
            onConfirmTap: onConfirmTap,
            closeText: closeText ?? "context.loc.good",
            onCloseTap: onCloseTap,
          );
        },
        idToCompare: '$message$confirmText$closeText');
  }

  static void showLuggageStorageDialog({
    required BuildContext context,
    required String? title,
    required String? message,
    required String? confirmText,
    required String? closeText,
    required Function()? onConfirmTap,
    required Function()? onCloseTap,
  }) {
    _handleDialogQueue(
      context: context,
      builder: (BuildContext context) {
        return ApeironSpaceDialog(
          title: title,
          message: message,
          confirmText: confirmText,
          onConfirmTap: onConfirmTap,
          closeText: closeText,
          onCloseTap: onCloseTap,
        );
      },
    );
  }

  static Future<void> _handleDialogQueue(
      {required BuildContext context,
      Color? barrierColor,
      required WidgetBuilder builder,
      bool dismissible = true,
      String? idToCompare}) async {
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
        // Waiting for animation
        const Duration duration = Duration(milliseconds: 200);
        await Future<dynamic>.delayed(duration);

        _queue.removeFirst().callback();
      }
    }

    if (_queue.isEmpty) {
      _queue.add(DialogQueueData(callback: callback, idToCompare: idToCompare));
      await callback();
    } else {
      if (idToCompare != null && _queue.last.idToCompare != idToCompare) {
        _queue.add(DialogQueueData(callback: callback, idToCompare: idToCompare));
      }
    }
  }

  static void clearAll(BuildContext context) {
    final bool hasClean = _queue.isNotEmpty;
    _queue.clear();

    if (hasClean) {
      Future<void>.delayed(const Duration(milliseconds: 200)).then((_) {
        Navigator.of(context).pop();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).brightness;
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      // Центрирование
      child: Container(
        margin: EdgeInsets.symmetric(  horizontal: screenWidth < 350 ? 20 :(screenWidth - 350) /2 ),
        constraints: BoxConstraints(maxHeight: 250),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme == Brightness.dark
              ? AppColors.gray.shade90 // Для темной темы
              : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
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
            // if (roomNumber != null)
            Text(
              textAlign: TextAlign.center,
              title ?? '',
              style: AppTypography.font20Regular.copyWith(
                // color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            message != null
                ? Text(
                    message ?? '',
                    style: AppTypography.font20Regular.copyWith(
                      color: AppColors.black,
                    ),
                  )
                : SizedBox(),

            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.white,
                backgroundColor: theme == Brightness.dark
                    ? AppColors.green300.withOpacity(0.8) // Для темной темы
                    : AppColors.green200.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                onConfirmTap == null ? null : onConfirmTap!();

                // onCancel!();
              },
              child: Text(
                this.confirmText ?? 'Подтвердить',
                style: AppTypography.font16Regular.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.white,
                backgroundColor: AppColors.orange.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                onCloseTap == null ? null : onCloseTap!();
              },
              // onPressed: null,
              child: Text(
                this.closeText ?? 'Отмена',
                style: AppTypography.font16Regular.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        // ],
        // ),
      ),
    );
  }
}

class DialogQueueData {
  const DialogQueueData({
    required this.callback,
    required this.idToCompare,
  });

  final Future<void> Function() callback;
  final String? idToCompare;
}
