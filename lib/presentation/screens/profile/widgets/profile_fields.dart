import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/date_time_extension.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/custom_text_field.dart';

Widget profileFields = Column(
  children: [
    customTextField(
      name: 'firstName',
      label: 'First name',
      keyboardType: TextInputType.name,
    ),
    customTextField(
      name: 'lastName',
      label: 'Last name',
      keyboardType: TextInputType.name,
    ),
    customTextField(
      name: 'homeNumber',
      label: 'Street/House number',
      keyboardType: TextInputType.phone,
    ),
    customTextField(
      name: 'city',
      label: 'City',
      keyboardType: TextInputType.name,
    ),
    customTextField(
      name: 'zipCode',
      label: 'Zip code',
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
      label: 'Type of job',
      keyboardType: TextInputType.name,
    ),
    customTextField(
      name: 'companyType',
      label: 'Type of company',
      keyboardType: TextInputType.name,
    ),
    customTextField(
      name: 'bankName',
      label: 'Bank name*',
      keyboardType: TextInputType.name,
    ),
    customTextField(
      name: 'iban',
      label: 'IBAN*',
      keyboardType: TextInputType.name,
    ),
    customTextField(
      name: 'legalNumber',
      label: 'Legal number*',
      keyboardType: TextInputType.phone,
    ),
    customTextField(
        name: 'email',
        label: 'Email address',
        keyboardType: TextInputType.emailAddress,
        validators: [
          FormBuilderValidators.email(errorText: "Wrong email format")
        ]),
    customTextField(
      name: 'mobileNumber',
      label: 'Mobile number*',
      keyboardType: TextInputType.phone,
    ),
    customTextField(
      name: 'taxId',
      isRequired: false,
      label: 'Tax ID (optional)',
      keyboardType: TextInputType.name,
    ),
    customTextField(
      name: 'accountantId',
      label: 'Accountant*',
      keyboardType: TextInputType.name,
    ),
    customTextField(
      name: 'notes',
      label: 'Notes',
      keyboardType: TextInputType.name,
      isRequired: false,
    ),
  ],
);
