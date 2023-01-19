import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/custom_scaffold.layout.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/custom_text_field.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldLayout(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(context.tr.contactUs, style: context.textTheme.headline6),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingH),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppConst.supportImg),
              ],
            ),
            kDefaultSpaceV,
            Text(
              context.tr.contactUsMsg,
              style: context.textTheme.headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            kDefaultSpaceV,
            _buildBodyForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyForm(BuildContext context) {
    return FormBuilder(
        initialValue: const {
          'email': 'kenzi.lawson@example.com',
          'phoneNumber': '(201) 555-0124',
        },
        child: Column(
          children: [
            customTextField(
              label: context.tr.email,
              name: 'email',
              padding: EdgeInsets.zero,
              filled: false,
            ),
            customTextField(
              label: context.tr.phoneNumber,
              name: 'phoneNumber',
              padding: EdgeInsets.zero,
              filled: false,
            ),
            kDefaultSpaceV,
            customTextField(
              label: context.tr.name,
              name: 'name',
              padding: EdgeInsets.zero,
              filled: true,
              isRequired: true,
            ),
            kDefaultSpaceV,
            customTextField(
              label: context.tr.email,
              name: 'emailAddress',
              padding: EdgeInsets.zero,
              filled: true,
              isRequired: true,
            ),
            kDefaultSpaceV,
            FormBuilderTextField(
              name: 'message',
              // keyboardType: keyboardType,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: context.tr.fieldRequiredMsg),
              ]),
              maxLines: 4,
              decoration: InputDecoration(
                labelText: context.tr.message,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            kDefaultSpaceV,
            ElevatedButton(
              onPressed: () {
                // if (formKey.currentState!.saveAndValidate()) {
                // }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(double.maxFinite, 8.h),
                shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
              ),
              child: Text(context.tr.submitMsg),
            ),
            kDefaultSpaceV,
          ],
        ));
  }
}
