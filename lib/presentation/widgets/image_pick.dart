import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/image.controller.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';

showBottomImageSelector(BuildContext context, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    elevation: 2,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    builder: (BuildContext context) {
      return SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () async {
                if (Navigator.of(context).canPop()) {
                  Navigator.pop(context);
                  await ref.read(imageControllerProvider.notifier).pickImage();
                }
              },
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppConst.cameraIcon),
                    kDefaultSpaceV,
                    Text('Camera'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                if (Navigator.of(context).canPop()) {
                  Navigator.pop(context);
                  await ref
                      .read(imageControllerProvider.notifier)
                      .pickImage(imageSource: ImageSource.gallery);
                }
              },
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppConst.galleryIcon),
                    kDefaultSpaceV,
                    Text('Gallery'),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
