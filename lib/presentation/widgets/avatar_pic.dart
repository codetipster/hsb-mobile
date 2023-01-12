import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/image.controller.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/image_network.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/image_pick.dart';
import 'package:sizer/sizer.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';

class AvatarPic extends ConsumerWidget {
  const AvatarPic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localDataSource = ref.watch(localDataSourceProvider);
    final imageContoller = ref.watch(imageControllerProvider);

    return SizedBox(
      height: 20.w,
      width: 20.w,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
              backgroundColor: context.theme.cardColor,
              child: imageContoller.image == null
                  ? customImageNetwork(
                      width: 20.w,
                      image: localDataSource.user.image,
                      token: localDataSource.authToken,
                    )
                  : Image.file(imageContoller.image!)),
          Positioned(
            right: -4,
            bottom: -8,
            child: SizedBox(
              height: 8.w,
              width: 8.w,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                        color: context.theme.scaffoldBackgroundColor),
                  ),
                  // primary: Colors.white,
                  backgroundColor: context.theme.cardColor,
                ),
                onPressed: () {
                  showBottomImageSelector(context, ref);
                },
                child: const ImageIcon(
                  AssetImage(AppConst.pineIcon),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget sourcePickerBtn({
    required String label,
    required String icon,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 2.w,
        height: 2.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon),
            kDefaultSpaceV,
            Text(label),
          ],
        ),
      ),
    );
  }
}
