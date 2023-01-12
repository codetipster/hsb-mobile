import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';

import 'ui_extension.dart';

/// A set of useful [AsyncValue] extensions
extension AsyncValueUI on AsyncValue {
  // isLoading shorthand (AsyncLoading is a subclass of AsycValue)
  bool get isLoading => this is AsyncLoading<void>;

  // show a snackbar on error only
  void showSnackBarOnError(BuildContext context, error) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: context.colorScheme.errorContainer,
          content: Text(
            error,
            style: context.textTheme.subtitle2!
                .copyWith(color: context.colorScheme.onErrorContainer),
          ),
        ),
      );

  // show a flushbar on error only
  void showFlushBarOnError(
    BuildContext context, {
    String? error,
  }) =>
      Flushbar(
        borderRadius: kDefaultRaduis,
        messageText: Text(error ?? '', textAlign: TextAlign.center),
        messageColor: context.colorScheme.error,
        titleColor: context.colorScheme.error,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.bounceIn,
        forwardAnimationCurve: Curves.elasticOut,
        backgroundColor: AppConst.whiteRedColor,
        duration: const Duration(seconds: 4),
        margin:
            EdgeInsets.symmetric(horizontal: kDefaultPaddingH, vertical: 10),
        icon: Icon(
          Icons.cancel_outlined,
          size: 28,
          color: context.colorScheme.error,
        ),
      )..show(context);

  void showFlushBarOnSuccess(
    BuildContext context, {
    String? success,
  }) =>
      Flushbar(
        borderRadius: kDefaultRaduis,
        messageText: Text(success ?? '', textAlign: TextAlign.center),
        messageColor: context.colorScheme.error,
        titleColor: context.colorScheme.error,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.bounceIn,
        forwardAnimationCurve: Curves.elasticOut,
        backgroundColor: AppConst.whiteRedColor,
        duration: const Duration(seconds: 4),
        margin:
            EdgeInsets.symmetric(horizontal: kDefaultPaddingH, vertical: 10),
      )..show(context);
}
