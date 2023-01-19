import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> pages(BuildContext context, WidgetRef ref) {
  return [
    PageViewModel(
      titleWidget: customRichText(
        context: context,
        label: context.tr.scanInvoice,
        label2: context.tr.ease,
      ),
      body: context.tr.onBoardDesc,
    ),
    PageViewModel(
      titleWidget: customRichText(
        context: context,
        label: context.tr.trackInvoice,
        label2: context.tr.ease,
      ),
      body: context.tr.onBoardDesc,
    ),
    PageViewModel(
      useScrollView: true,
      titleWidget: customRichText(
        context: context,
        label: context.tr.addInvoice,
        label2: context.tr.ease,
      ),
      body: context.tr.onBoardDesc,
      footer: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: ElevatedButton(
          onPressed: () {
            ref
                .read(localDataSourceProvider)
                .storeOnBoardState(showOnBoard: true);
            onBoardStateListenable.value =
                ref.watch(localDataSourceProvider).showOnBoard;
            context.go.pushNamed(RouteName.signIn);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
            fixedSize: Size(50.w, 8.h),
          ),
          child: Text(context.tr.getStarted),
        ),
      ),
      // decoration: PageDecoration(
      //   imagePadding: EdgeInsets.only(top: 8.h),
      //   bodyFlex: 2,
      // ),
    ),
  ];
}

Widget customRichText({
  required BuildContext context,
  required String label,
  required String label2,
}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: context.textTheme.headline3,
      children: <TextSpan>[
        TextSpan(
            text: label,
            style: context.textTheme.headline3?.copyWith(
              fontWeight: FontWeight.bold,
            )),
        TextSpan(
            text: label2,
            style: context.textTheme.headline3?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
            )),
      ],
    ),
  );
}
