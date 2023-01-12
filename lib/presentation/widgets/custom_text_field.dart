import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';

Widget customTextField({
  required String name,
  required String label,
  EdgeInsetsGeometry? padding,
  bool filled = true,
  TextInputType? keyboardType = TextInputType.name,
  bool isRequired = true,
  List<String? Function(String?)>? validators,
}) {
  return Padding(
    padding: padding ?? EdgeInsets.only(bottom: kDefaultPaddingV),
    child: FormBuilderTextField(
      name: name,
      keyboardType: keyboardType,
      validator: FormBuilderValidators.compose([
        if (isRequired)
          FormBuilderValidators.required(errorText: "Field is required!"),
        ...validators ?? []
      ]),
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        filled: filled,
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    ),
  );
}
