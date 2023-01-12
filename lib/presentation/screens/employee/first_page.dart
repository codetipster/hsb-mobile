import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FirstPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final void Function(GlobalKey<FormBuilderState>)? onPressed;
  FirstPage({
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
                SizedBox(width: 25.w),
                Expanded(
                  child: FormBuilderTextField(
                    name: 'company',
                    // keyboardType: keyboardType,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "Field is required!"),
                    ]),
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Betrieb (Name u. Adresse des Arbeitgebers',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
              ]),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'name',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'firstName',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Vorname',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'birthName',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Geburtsname',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'birthDate',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Geburtsdatum',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'birthPlace',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Geburtsort',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'nationality',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Staatsangehörigkeit',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'homeNumber',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Straße/ Hausnummer',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'postalCode',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Postleitzahl/ Ort',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'jobTitle',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Berufsbezeichnung',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'healthInsurance',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: "Field is required!"),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Krankenkasse',
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
            ],
          ),
        ),
      ),
    );
  }
}
