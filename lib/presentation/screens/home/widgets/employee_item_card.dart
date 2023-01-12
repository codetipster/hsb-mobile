import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/data/entities/employee.entity.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:flutter/material.dart';

class EmployeeItemCard extends StatelessWidget {
  final EmployeeEntity data;
  const EmployeeItemCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.name, style: context.textTheme.bodyLarge),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(data.jobTitle, style: context.textTheme.subtitle2),
      ),
      trailing: PopupMenuButton(
        child: Image.asset(AppConst.dotsIcon),
        onSelected: (item) => onSelected(context, item as int),
        itemBuilder: (context) => [
          const PopupMenuItem<int>(
            value: 0,
            child: Text('Edit'),
          ),
        ],
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        context.go.pushNamed(RouteName.editEmployee, extra: data.toJson());
        break;
    }
  }
}
