import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/date_time_extension.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/custom_text_field.dart';
import 'package:path/path.dart';

Widget profileFields(BuildContext context) => Column(
      children: [
        customTextField(
          name: 'firstName',
          label: context.tr.firstName,
          keyboardType: TextInputType.name,
        ),
        customTextField(
          name: 'lastName',
          label: context.tr.lastName,
          keyboardType: TextInputType.name,
        ),
        customTextField(
          name: 'homeNumber',
          label: context.tr.houseNumber,
          keyboardType: TextInputType.phone,
        ),
        customTextField(
          name: 'city',
          label: context.tr.city,
          keyboardType: TextInputType.name,
        ),
        customTextField(
          name: 'zipCode',
          label: context.tr.zipCode,
          keyboardType: TextInputType.phone,
        ),
        // FormBuilderDateTimePicker(
        //   name: 'createdAt',
        //   fieldLabelText: 'Start date',
        //   // initialValue: DateTime,
        //   currentDate: DateTime.now(),
        //   inputType: InputType.date,
        //   validator: FormBuilderValidators.compose(
        //       [FormBuilderValidators.required(errorText: 'Field is required!')]),
        //   decoration: const InputDecoration(
        //     suffixIcon: Icon(Icons.calendar_month_outlined),
        //     filled: true,
        //     fillColor: Colors.white,
        //     border: OutlineInputBorder(borderSide: BorderSide.none),
        //   ),
        // ),
        kDefaultSpaceV,
        customTextField(
          name: 'jobType',
          label: context.tr.jobType,
          keyboardType: TextInputType.name,
        ),
        customTextField(
          name: 'companyType',
          label: context.tr.companyType,
          keyboardType: TextInputType.name,
        ),
        customTextField(
          name: 'bankName',
          label: context.tr.bankName,
          keyboardType: TextInputType.name,
        ),
        customTextField(
          name: 'iban',
          label: context.tr.iban,
          keyboardType: TextInputType.name,
        ),
        customTextField(
          name: 'legalNumber',
          label: context.tr.legalNumber,
          keyboardType: TextInputType.phone,
        ),
        customTextField(
            name: 'email',
            label: context.tr.email,
            keyboardType: TextInputType.emailAddress,
            validators: [
              FormBuilderValidators.email(errorText: context.tr.emailMsg)
            ]),
        customTextField(
          name: 'mobileNumber',
          label: context.tr.mobileNumber,
          keyboardType: TextInputType.phone,
        ),
        customTextField(
          name: 'taxId',
          isRequired: false,
          label: context.tr.taxId,
          keyboardType: TextInputType.name,
        ),
        customTextField(
          name: 'accountantId',
          enabled: false,
          label: context.tr.accountantId,
          keyboardType: TextInputType.name,
        ),
        customTextField(
          name: 'notes',
          label: context.tr.notes,
          keyboardType: TextInputType.name,
          isRequired: false,
        ),
      ],
    );
