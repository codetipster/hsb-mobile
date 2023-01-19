import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/screens/auth/widgets/custom_auth_Scaffold_layout.dart';
import 'package:invoice_tracking_flutter/presentation/screens/auth/widgets/signin_form.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffoldLayout(
      body: Column(
        children: [
          _buildTitleSection(context),
          kDefaultSpaceV,
          SignInForm(),
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
          context.tr.signIn,
          style:
              Theme.of(context).textTheme.headline6?.copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: 1.h),
        Text(
          context.tr.enterInfo,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
