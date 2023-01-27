// ignore: must_be_immutable
import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/auth.controller.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';

class SignInForm extends ConsumerWidget {
  SignInForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingH,
        ),
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'legalNumber', //123232324
              keyboardType: TextInputType.name,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "Field is required!"),
              ]),
              decoration: InputDecoration(
                labelText: context.tr.legalNumber,
                hintText: context.tr.enterLegalNumber,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            kDefaultSpaceV,
            FormBuilderTextField(
              name: 'password',
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "Field is required!"),
              ]),
              decoration: InputDecoration(
                labelText: context.tr.password,
                hintText: context.tr.enterPassword,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Image.asset(AppConst.hideIcon),
              ),
            ),
            kDefaultSpaceV,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () =>
                      context.go.pushNamed(RouteName.forgetPasswordScreen),
                  child: Text(
                    context.tr.forgetPassword,
                    style: context.textTheme.subtitle2,
                  ),
                )
              ],
            ),
            kDefaultSpaceV,
            kDefaultSpaceV,
            _buildLoginButton(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);

    return ElevatedButton(
      onPressed: authController.maybeWhen(
        orElse: () => null,
        data: (data) => () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            ref
                .read(authControllerProvider.notifier)
                .signIn(context, formData: _formKey.currentState?.value);
          }
        },
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.maxFinite, 8.h),
        shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
      ),
      child: authController.when(
        data: (data) => Text(context.tr.signIn),
        error: (e, s) => null,
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
