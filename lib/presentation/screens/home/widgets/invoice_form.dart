import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/custom_text_field.dart';

void invoiceFormDialog(
    BuildContext context, GlobalKey<FormBuilderState> formKey,
    {required Function() onConfirm}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        title: Text(context.tr.invoiceTitle),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: context.theme.scaffoldBackgroundColor),
            child: Text(
              context.tr.cancel,
              style: context.textTheme.button!.copyWith(
                color: context.colorScheme.secondary,
              ),
            ),
          ),
          ElevatedButton(onPressed: onConfirm, child: const Text('Done')),
        ],
        content: FormBuilder(
          key: formKey,
          child: customTextField(
              label: context.tr.invoiceName,
              name: 'name',
              padding: EdgeInsets.zero,
              isRequired: true,
              filled: true),
        ),
      );
    },
  );
}
