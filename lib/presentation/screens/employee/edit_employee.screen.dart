import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/employee.controller.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/custom_scaffold.layout.dart';

final stepsProvider = StateProvider.autoDispose<int>((ref) => 0);

class EditEmployeeScreen extends ConsumerWidget {
  final Map<String, dynamic> formData;
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  EditEmployeeScreen({super.key, required this.formData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeController = ref.watch(employeeControllerProvider);

    return CustomScaffoldLayout(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: context.colorScheme.onBackground,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(context.tr.editEmployee, style: context.textTheme.headline6),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: FormBuilder(
          key: formKey,
          initialValue: formData,
          child: Column(
            children: [
              SizedBox(width: 25.w),
              Row(children: [
                SizedBox(width: 25.w),
                Expanded(
                  child: FormBuilderTextField(
                    name: 'company',
                    // keyboardType: keyboardType,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Krankenkasse',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'iban',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
                ]),
                decoration: const InputDecoration(
                  labelText: 'Beginn',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              kDefaultSpaceV,
              kDefaultSpaceV,
              FormBuilderTextField(
                name: 'ort',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: context.tr.fieldRequiredMsg),
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
                      errorText: context.tr.fieldRequiredMsg),
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
              ElevatedButton(
                onPressed: employeeController.maybeWhen(
                  orElse: () => null,
                  data: (data) => () {
                    if (formKey.currentState!.saveAndValidate()) {
                      ref
                          .read(employeeControllerProvider.notifier)
                          .updateEmployee(context,
                              id: formData['id'],
                              data: formKey.currentState!.value);
                    }
                  },
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 8.h),
                  shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
                ),
                child: employeeController.when(
                  data: (data) => Text(context.tr.save),
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
