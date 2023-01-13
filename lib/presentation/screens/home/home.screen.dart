import 'dart:io';

import 'package:invoice_tracking_flutter/presentation/controllers/downloder.controller.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/employee.controller.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/date_time_extension.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '/config/app.router.dart';
import '/config/constants.dart';
import '/presentation/widgets/app_error.dart';
import '/presentation/widgets/image_pick.dart';
import '/presentation/extensions/ui_extension.dart';
import '/presentation/controllers/image.controller.dart';
import '/presentation/controllers/report.controller.dart';
import '/presentation/screens/home/widgets/item_card.dart';
import '/presentation/controllers/invoice.controller.dart';
import '/presentation/widgets/custom_scaffold.layout.dart';
import '/presentation/screens/home/widgets/invoice_form.dart';
import '/presentation/screens/home/widgets/custom_appbar.dart';
import '/presentation/screens/home/widgets/employee_item_card.dart';
import '/presentation/widgets/app_circular_progress_indicator.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  TabController? tabController;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      platformState.value = TargetPlatform.android;
    } else {
      platformState.value = TargetPlatform.iOS;
    }
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      imageControllerProvider,
      (previous, next) {
        invoiceFormDialog(
          context,
          _formKey,
          onConfirm: () {
            if (_formKey.currentState!.saveAndValidate()) {
              ref.read(invoiceControllerProvider.notifier).uploadInvoice(
                    context,
                    name: _formKey.currentState!.value['name'],
                    image: ref.watch(imageControllerProvider).image!,
                  );
              ref.read(imageControllerProvider.notifier).image = null;
              Navigator.of(context).pop();
            }
          },
        );
      },
    );

    return CustomScaffoldLayout(
      appBar: customAppBar(context, ref, showBottom: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildUploadCardSection(context),
          kDefaultSpaceV,
          _buildTabBarSection(context),
          _buildTabViewSection(context),
        ],
      ),
    );
  }

  Widget _buildUploadCardSection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: kDefaultRaduis,
        color: Colors.grey[100],
      ),
      margin: EdgeInsets.only(top: 2.h),
      padding: EdgeInsets.symmetric(vertical: kDefaultPaddingV),
      child: InkWell(
        onTap: () async {
          showBottomImageSelector(context, ref);
        },
        child: Column(
          children: [
            Image.asset(AppConst.addIcon),
            kDefaultSpaceV,
            Text('Upload your Invoice', style: context.textTheme.headline6),
            SizedBox(height: 1.h),
            Text(
                'You can upload an invoice by importing or\nscanning with your camera',
                textAlign: TextAlign.center,
                style: context.textTheme.subtitle2),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBarSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: kDefaultRaduis,
      ),
      width: double.infinity,
      height: 8.h,
      child: TabBar(
        controller: tabController,
        isScrollable: false,
        labelColor: context.colorScheme.onBackground,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3,
        tabs: const [
          Tab(text: 'Invoices'),
          Tab(text: 'Reports'),
          Tab(text: 'Employees'),
        ],
      ),
    );
  }

  Widget _buildTabViewSection(BuildContext context) {
    final invoiceController = ref.watch(invoiceControllerProvider);
    final reportController = ref.watch(reportControllerProvider);
    final employeeController = ref.watch(employeeControllerProvider);

    return Container(
      padding: EdgeInsets.only(top: 1.h),
      height: 63.h, //63.h
      child: TabBarView(
        controller: tabController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('See all'),
                onPressed: () => context.go.pushNamed(RouteName.invoices),
              ),
              Expanded(
                child: invoiceController.when(
                  data: (data) => ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => ItemCard(
                      title: data[index].name,
                      subTitle: data[index].createdAt!.dateString(),
                      status: data[index].status,
                      file: data[index].image,
                    ),
                  ),
                  error: (error, stackTrace) => AppError(
                      title: error.toString(),
                      onPressed: () {
                        ref
                            .read(invoiceControllerProvider.notifier)
                            .initialize();
                      },
                      flex: false),
                  loading: () =>
                      const AppCircularProgressIndicator(flex: false),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('See all'),
                onPressed: () => context.go.pushNamed(RouteName.reports),
              ),
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
                        ref
                            .read(reportControllerProvider.notifier)
                            .initialize();
                      },
                      flex: false),
                  loading: () =>
                      const AppCircularProgressIndicator(flex: false),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('See all'),
                onPressed: () => context.go.pushNamed(RouteName.employees),
              ),
              Expanded(
                  child: employeeController.when(
                data: (data) => ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      EmployeeItemCard(data: data[index]),
                ),
                error: (error, stackTrace) => AppError(
                    title: error.toString(),
                    onPressed: () {
                      ref
                          .read(employeeControllerProvider.notifier)
                          .initialize();
                    },
                    flex: false),
                loading: () => const AppCircularProgressIndicator(flex: false),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
