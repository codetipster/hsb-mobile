import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:invoice_tracking_flutter/presentation/screens/auth/widgets/custom_auth_Scaffold_layout.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/responsive_size.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';

class OtpScreen extends ConsumerWidget {
  OtpScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAuthScaffoldLayout(
      body: Column(
        children: [
          _buildTitleSection(context),
          kDefaultSpaceV,
          _buildForm(context, ref),
          kDefaultSpaceV,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.tr.otpReceived,
                style: context.textTheme.subtitle2,
              ),
              kDefaultSpaceH,
              Text(
                context.tr.resendCode,
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
        kDefaultSpaceV,
        kDefaultSpaceV,
        Text(
          context.tr.scOtp,
          style:
              Theme.of(context).textTheme.headline6?.copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: 1.h),
        Text(context.tr.fillOtp,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2),
      ],
    );
  }

  Widget _buildForm(BuildContext context, WidgetRef ref) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingH),
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'otp',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "Field is required!"),
              ]),
              decoration: InputDecoration(
                labelText: context.tr.oneTimePass,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: const Icon(Icons.pin_outlined),
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
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.saveAndValidate()) {
          if (ref.watch(localDataSourceProvider).user.otp ==
              _formKey.currentState!.value['otp']) {
            context.go.pushReplacementNamed(RouteName.createPasswordScreen);
          } else {
            Flushbar(
              borderRadius: kDefaultRaduis,
              messageText:
                  const Text('Wrong OTP code', textAlign: TextAlign.center),
              messageColor: context.colorScheme.error,
              titleColor: context.colorScheme.error,
              flushbarPosition: FlushbarPosition.TOP,
              flushbarStyle: FlushbarStyle.FLOATING,
              reverseAnimationCurve: Curves.bounceIn,
              forwardAnimationCurve: Curves.elasticOut,
              backgroundColor: AppConst.whiteRedColor,
              duration: const Duration(seconds: 4),
              margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPaddingH, vertical: 10),
              icon: Icon(
                Icons.cancel_outlined,
                size: 28,
                color: context.colorScheme.error,
              ),
            ).show(context);
          }
        }
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.maxFinite, 8.h),
        shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
      ),
      child: Text(context.tr.confirm),
    );
  }
}
