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
        title: Text('Contact Us', style: context.textTheme.headline6),
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
              'Having any question? We are ready to help',
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
              label: 'Email',
              name: 'email',
              padding: EdgeInsets.zero,
              filled: false,
            ),
            customTextField(
              label: 'Phone number',
              name: 'phoneNumber',
              padding: EdgeInsets.zero,
              filled: false,
            ),
            kDefaultSpaceV,
            customTextField(
              label: 'Name',
              name: 'name',
              padding: EdgeInsets.zero,
              filled: true,
              isRequired: true,
            ),
            kDefaultSpaceV,
            customTextField(
              label: 'Email Address',
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
                FormBuilderValidators.required(errorText: "Field is required!"),
              ]),
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Message',
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
              child: Text('Submit message'),
            ),
            kDefaultSpaceV,
          ],
        ));
  }
}
