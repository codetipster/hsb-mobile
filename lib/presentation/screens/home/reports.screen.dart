import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/report.controller.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/date_time_extension.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/screens/home/widgets/custom_appbar.dart';
import 'package:invoice_tracking_flutter/presentation/screens/home/widgets/item_card.dart';

import '../../widgets/app_circular_progress_indicator.dart';
import '../../widgets/app_error.dart';
import '../../widgets/custom_scaffold.layout.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportController = ref.watch(reportControllerProvider);

    return CustomScaffoldLayout(
      appBar: customAppBar(context, ref),
      isScrollable: false,
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(reportControllerProvider.notifier).initialize();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kDefaultSpaceV,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('All Reports', style: context.textTheme.headline6),
              ],
            ),
            kDefaultSpaceV,
            Expanded(
              child: reportController.when(
                data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => ItemCard(
                    title: data[index].name,
                    subTitle: data[index].createdAt!.dateString(),
                    status: '',
                    file: data[index].file,
                  ),
                ),
                error: (error, stackTrace) => AppError(
                    title: error.toString(),
                    onPressed: () {
                      ref.read(reportControllerProvider.notifier).initialize();
                    },
                    flex: false),
                loading: () => const AppCircularProgressIndicator(flex: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
