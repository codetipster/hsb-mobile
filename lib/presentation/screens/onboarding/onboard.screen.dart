import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';

import 'pages.dart';

class OnBoardScreen extends ConsumerWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConst.whiteRedColor,
        title: Image.asset(
          AppConst.logohImg,
          width: 13.w,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              ref
                  .read(localDataSourceProvider)
                  .storeOnBoardState(showOnBoard: true);
              onBoardStateListenable.value =
                  ref.watch(localDataSourceProvider).showOnBoard;
              context.go.pushNamed(RouteName.signIn);
            },
            child: Text(
              context.tr.skip,
              style: context.textTheme.subtitle2?.copyWith(fontSize: 16.sp),
            ),
          ),
          kDefaultSpaceH,
        ],
        bottom: PreferredSize(
          preferredSize: Size(0, 35.h),
          child: Image.asset(
            alignment: Alignment.centerRight,
            AppConst.onBoardImg,
            width: double.infinity,
            height: 35.h,
          ),
        ),
      ),
      body: IntroductionScreen(
        pages: pages(context, ref),
        showBackButton: false,
        showNextButton: true,
        showDoneButton: false,
        nextFlex: 0,
        dotsFlex: 5,
        next: Container(
          width: 15.w,
          height: 8.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.primary,
          ),
          child: const Icon(Icons.arrow_forward_rounded, color: Colors.white),
        ),
        dotsDecorator: _buildDecoratorStyle(context),
      ),
    );
  }

  DotsDecorator _buildDecoratorStyle(BuildContext context) {
    return DotsDecorator(
      size: const Size.square(10),
      activeSize: const Size(30, 10),
      activeColor: Theme.of(context).colorScheme.secondary,
      spacing: const EdgeInsets.symmetric(horizontal: 4),
      activeShape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
    );
  }
}
