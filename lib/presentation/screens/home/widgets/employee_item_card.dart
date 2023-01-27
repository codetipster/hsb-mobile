import 'package:sizer/sizer.dart';
import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/data/entities/employee.entity.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:flutter/material.dart';

enum EmployeeStatus { accepted, pending, deleted }

class EmployeeItemCard extends StatelessWidget {
  final EmployeeEntity data;
  const EmployeeItemCard({super.key, required this.data});

  EmployeeStatus get employeeStatus {
    switch (data.status) {
      case 'ACCEPTED':
        return EmployeeStatus.accepted;
      case 'PENDING':
        return EmployeeStatus.pending;
      case 'DELETED':
        return EmployeeStatus.deleted;
      default:
        return EmployeeStatus.pending;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.name, style: context.textTheme.bodyLarge),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(data.jobTitle, style: context.textTheme.subtitle2),
      ),
      trailing: SizedBox(
        width: 35.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildStatusCard(context),
            kDefaultSpaceH,
            kDefaultSpaceH,
            PopupMenuButton(
              child: Image.asset(AppConst.dotsIcon),
              onSelected: (item) => onSelected(context, item as int),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(context.tr.edit),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(context.tr.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        context.go.pushNamed(RouteName.editEmployee, extra: data.toJson());
        break;
      case 1:
        context.go.pushNamed(RouteName.editEmployee, extra: data.toJson());
        break;
    }
  }

  Widget _buildStatusCard(BuildContext context) {
    switch (employeeStatus) {
      case EmployeeStatus.pending:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(242, 123, 13, 0.15),
            borderRadius: BorderRadius.circular(1.6.w),
          ),
          child: Text(
            context.tr.pending,
            style: TextStyle(color: Color(0xffF27B0D)),
          ),
        );
      case EmployeeStatus.accepted:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(112, 236, 186, 0.15),
            borderRadius: BorderRadius.circular(1.6.w),
          ),
          child: Text(
            context.tr.accepted,
            style: TextStyle(color: Color(0xff008751)),
          ),
        );
      case EmployeeStatus.deleted:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 235, 236, 1),
            borderRadius: BorderRadius.circular(1.6.w),
          ),
          child: Text(
            context.tr.deleted,
            style: TextStyle(color: Color.fromRGBO(146, 3, 4, 1)),
          ),
        );
    }
  }
}
