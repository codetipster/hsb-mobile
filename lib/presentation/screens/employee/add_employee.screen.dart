import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/employee.controller.dart';
import 'package:invoice_tracking_flutter/presentation/screens/employee/first_page.dart';
import 'package:invoice_tracking_flutter/presentation/screens/employee/second_page.dart';
import 'package:invoice_tracking_flutter/presentation/screens/employee/third_page.dart';
import 'package:path/path.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/custom_scaffold.layout.dart';

final stepsProvider = StateProvider.autoDispose<int>((ref) => 0);

class AddEmployeeScreen extends ConsumerWidget {
  Map<String, dynamic> formData = {};
  AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeStep = ref.watch(stepsProvider);

    return CustomScaffoldLayout(
      isScrollable: false,
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: context.colorScheme.onBackground,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(context.tr.addEmployee, style: context.textTheme.headline6),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NumberStepper(
            enableStepTapping: false,
            enableNextPreviousButtons: false,
            lineLength: 25.w,
            lineDotRadius: 1,
            numbers: const [1, 2, 3],
            activeStep: activeStep,
            activeStepBorderColor: Colors.transparent,
            activeStepColor: AppConst.whiteRedColor,
            lineColor: Colors.grey[200],
            stepRadius: 15,
            stepColor: Colors.grey[200],
          ),
          kDefaultSpaceV,
          Expanded(child: _buildBodyFields(context, ref)),
        ],
      ),
    );
  }

  Widget _buildBodyFields(BuildContext context, WidgetRef ref) {
    final step = ref.watch(stepsProvider);
    switch (step) {
      case 0:
        return FirstPage(
          onPressed: (formKey) {
            formData.addAll(formKey.currentState!.value);
            ref.read(stepsProvider.notifier).state = step + 1;
          },
        );
      case 1:
        return SecondPage(
          onPressed: (formKey) {
            formData.addAll(formKey.currentState!.value);
            ref.read(stepsProvider.notifier).state = step + 1;
          },
        );
      case 2:
        return ThirdPage(
          onPressed: (formKey) {
            formData.addAll(formKey.currentState!.value);
            ref
                .read(employeeControllerProvider.notifier)
                .createEmployee(context, data: formData);
            ref.read(stepsProvider.notifier).state = 0;
          },
        );
      default:
        return const SizedBox();
    }
  }
}
