import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';

Widget customImageNetwork(
    {required String image, required String token, double? width}) {
  return FadeInImage(
    width: width ?? 10.w,
    placeholder: const AssetImage(AppConst.personImg),
    image: NetworkImage(image, headers: {'Authorization': token}),
    imageErrorBuilder: (context, error, stackTrace) =>
        Image.asset(AppConst.personImg, width: 10.w),
  );
}
