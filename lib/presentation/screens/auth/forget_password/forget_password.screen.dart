import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/screens/auth/widgets/custom_auth_scaffold_layout.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffoldLayout(
      body: Column(
        children: [
          kDefaultSpaceV,
          kDefaultSpaceV,
          _buildTitleSection(context),
          kDefaultSpaceV,
          _buildForm(context),
          kDefaultSpaceV,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.tr.rememberPassword,
                style: context.textTheme.subtitle2,
              ),
              kDefaultSpaceH,
              Text(
                context.tr.signIn,
                style: context.textTheme.subtitle1,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection(BuildContext context) {
    return Column(
      children: [
        Text(
          context.tr.scForgetPassword,
          style:
              Theme.of(context).textTheme.headline6?.copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: 1.h),
        Text(context.tr.fillInput,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingH),
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'email',
              keyboardType: TextInputType.emailAddress,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "Field is required!"),
                FormBuilderValidators.email(
                    errorText: "Not in a correct format")
              ]),
              decoration: InputDecoration(
                labelText: context.tr.email,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: const Icon(Icons.email_outlined),
              ),
            ),
            kDefaultSpaceV,
            kDefaultSpaceV,
            _buildConfirmButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    // final state = ref.watch(signInPageControllerProvider);

    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.saveAndValidate() ?? false) {}
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.maxFinite, 8.h),
        shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
      ),
      child: Text(context.tr.confirm),
    );
  }
}
