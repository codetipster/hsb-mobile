import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/auth.controller.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/screens/auth/widgets/custom_auth_scaffold_layout.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ForgetPasswordScreen extends ConsumerWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAuthScaffoldLayout(
      body: Column(
        children: [
          kDefaultSpaceV,
          kDefaultSpaceV,
          _buildTitleSection(context),
          kDefaultSpaceV,
          _buildForm(context, ref),
          kDefaultSpaceV,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.tr.rememberPassword,
                style: context.textTheme.subtitle2,
              ),
              kDefaultSpaceH,
              GestureDetector(
                onTap: () {
                  context.go.pop();
                },
                child: Text(
                  context.tr.signIn,
                  style: context.textTheme.subtitle1,
                ),
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

  Widget _buildForm(BuildContext context, ref) {
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
            _buildConfirmButton(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);

    return ElevatedButton(
      onPressed: authController.maybeWhen(
        orElse: () => null,
        data: (data) => () {
          if (_formKey.currentState!.saveAndValidate()) {
            ref
                .read(authControllerProvider.notifier)
                .sendOtp(context, formData: _formKey.currentState!.value);
          }
        },
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.maxFinite, 8.h),
        shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
      ),
      child: authController.when(
        data: (data) => Text(context.tr.confirm),
        error: (e, s) => null,
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
