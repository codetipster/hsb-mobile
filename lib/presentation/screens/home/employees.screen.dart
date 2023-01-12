import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/employee.controller.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/screens/home/widgets/custom_appbar.dart';
import 'package:invoice_tracking_flutter/presentation/screens/home/widgets/employee_item_card.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/custom_scaffold.layout.dart';

import '../../widgets/app_circular_progress_indicator.dart';
import '../../widgets/app_error.dart';

class EmployeesScreen extends ConsumerWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeController = ref.watch(employeeControllerProvider);

    return CustomScaffoldLayout(
      isScrollable: false,
      appBar: customAppBar(context, ref),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go.pushNamed(RouteName.addEmployee);
        },
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(employeeControllerProvider.notifier).initialize();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kDefaultSpaceV,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('All Employees', style: context.textTheme.headline6),
              ],
            ),
            kDefaultSpaceV,
            Expanded(
              child: employeeController.when(
                data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      EmployeeItemCard(data: data[index]),
                ),
                error: (error, stackTrace) =>
                    AppError(title: error.toString(), flex: false),
                loading: () => const AppCircularProgressIndicator(flex: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
