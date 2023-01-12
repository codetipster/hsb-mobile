import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import '/config/constants.dart';
import '../../../widgets/image_network.dart';
import '/presentation/extensions/ui_extension.dart';
import '/data/datasources/local/local.datasource.dart';
import '/presentation/extensions/date_time_extension.dart';

AppBar customAppBar(BuildContext context, WidgetRef ref,
    {bool showBottom = false}) {
  final localDataSource = ref.watch(localDataSourceProvider);

  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Image.asset(AppConst.logohImg, width: 15.w),
    backgroundColor: context.theme.scaffoldBackgroundColor,
    actions: [
      InkWell(
        child: Image.asset(AppConst.notificationIcon, width: 8.w),
        onTap: () => context.go.pushNamed(RouteName.notification),
      ),
      kDefaultSpaceH,
      customImageNetwork(
        image: localDataSource.user.image,
        token: localDataSource.authToken,
      ),
      SizedBox(width: 3.w),
    ],
    bottom: showBottom
        ? PreferredSize(
            preferredSize: Size(double.maxFinite, 5.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingH),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi, ${localDataSource.user.firstName}',
                    style: context.textTheme.headline5
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    DateTimeX.current.dateString(),
                    style:
                        context.textTheme.headline4?.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          )
        : null,
  );
}
