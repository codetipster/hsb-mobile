import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';

void yesNoDialog(
  BuildContext context, {
  String? title,
  required String content,
  required Function() onConfirm,
}) async {
  return showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.amber),
            Text(title ?? 'Worning'),
          ],
        ),
        actions: [
          CupertinoButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            // style: ElevatedButton.styleFrom(
            //     elevation: 0,
            //     backgroundColor: context.theme.scaffoldBackgroundColor),
            child: Text(
              'Cancel',
              style: context.textTheme.button!.copyWith(
                color: context.colorScheme.secondary,
              ),
            ),
          ),
          CupertinoButton(onPressed: onConfirm, child: Text(context.tr.confirm)),
        ],
        content: Text(content),
      );
    },
  );
}
