import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SecondPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final void Function(GlobalKey<FormBuilderState>)? onPressed;
  SecondPage({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            children: [
              Row(children: [
                Text('Kontodaten', style: context.textTheme.headline6)
              ]),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'iban',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'IBAN',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'bankName',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Bankname',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'salary',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Gehalt (Brutto)',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'employmentType',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Beschäftigungsverhältnis',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'beginning',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Beginn',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.saveAndValidate()) {
                    onPressed!(formKey);
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 8.h),
                  shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
                ),
                child: Text('Next'),
              ),
              kDefaultSpaceV,
            ],
          ),
        ),
      ),
    );
  }
}
