import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/downloder.controller.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/utils/permissions.dart';
import 'package:invoice_tracking_flutter/presentation/utils/storage.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

enum ItemStatus { completed, inreview, incomplete, none }

class ItemCard extends ConsumerWidget {
  final String title;
  final String file;
  final String subTitle;
  final String status;

  ItemStatus get itemStatus {
    switch (status) {
      case 'COMPLETED':
        return ItemStatus.completed;
      case 'INREVIEW':
        return ItemStatus.inreview;
      case 'INCOMPLETED':
        return ItemStatus.incomplete;
      default:
        return ItemStatus.none;
    }
  }

  const ItemCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.status,
      required this.file});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloader = ref.watch(downloaderProvider(file));

    return ListTile(
      onTap: () => ref.read(downloaderProvider(file).notifier).open(context),
      title: Text(title, style: context.textTheme.bodyLarge),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(subTitle, style: context.textTheme.subtitle2),
      ),
      trailing: SizedBox(
        width: 35.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (itemStatus != ItemStatus.none) _buildStatusCard(context),
            kDefaultSpaceH,
            downloader.maybeWhen(
              orElse: () {
                return const Text('X');
              },
              data: (data) {
                if (data != null) {
                  return Text(data);
                } else {
                  return InkWell(
                    child: Image.asset(AppConst.downloadIcon, width: 24),
                    onTap: () => ref
                        .read(downloaderProvider(file).notifier)
                        .download(context),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context) {
    switch (itemStatus) {
      case ItemStatus.inreview:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(242, 123, 13, 0.15),
            borderRadius: BorderRadius.circular(1.6.w),
          ),
          child: Text(
            context.tr.inreview,
            style: TextStyle(color: Color(0xffF27B0D)),
          ),
        );
      case ItemStatus.completed:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(112, 236, 186, 0.15),
            borderRadius: BorderRadius.circular(1.6.w),
          ),
          child: Text(
            context.tr.completed,
            style: TextStyle(color: Color(0xff008751)),
          ),
        );
      case ItemStatus.incomplete:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 235, 236, 1),
            borderRadius: BorderRadius.circular(1.6.w),
          ),
          child: Text(
            context.tr.incomplete,
            style: TextStyle(color: Color.fromRGBO(146, 3, 4, 1)),
          ),
        );
      case ItemStatus.none:
        return const SizedBox();
    }
  }
}
