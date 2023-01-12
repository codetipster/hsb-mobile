import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/employee.controller.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ThirdPage extends ConsumerWidget {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final void Function(GlobalKey<FormBuilderState>)? onPressed;
  ThirdPage({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeController = ref.watch(employeeControllerProvider);

    return FormBuilder(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              FormBuilderCheckbox(
                name: 'taxNumber',
                title: Text(
                  'Steuer – Identifikationsnummer',
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              FormBuilderCheckbox(
                name: 'socialNumber',
                title: Text(
                  'Sozialversicherungsnummer',
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'ort',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  hintText: 'Ort, Datum: .....................................',
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'unt',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  hintText:
                      'Unterschrift: .....................................',
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderCheckbox(
                name: 'accept',
                title: Text('Test'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
              ),
              kDefaultSpaceV,
              ElevatedButton(
                onPressed: employeeController.maybeWhen(
                  orElse: () => null,
                  data: (data) => () {
                    if (formKey.currentState!.saveAndValidate()) {
                      onPressed!(formKey);
                    }
                  },
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 8.h),
                  shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
                ),
                child: employeeController.when(
                  data: (data) => Text('Submit'),
                  error: (e, s) => null,
                  loading: () => const CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
