import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';

class CustomAuthScaffoldLayout extends StatelessWidget {
  final Widget? body;
  const CustomAuthScaffoldLayout({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size(0, 4.h),
          child: Image.asset(
            AppConst.logohImg,
            width: 10.h,
            alignment: Alignment.bottomCenter,
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
      ),
      backgroundColor: AppConst.whiteRedColor,
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 77.h,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(child: body),
      ),
    );
  }
}
