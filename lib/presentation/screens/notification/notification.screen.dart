import 'package:flutter/material.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/custom_scaffold.layout.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldLayout(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: context.theme.iconTheme.copyWith(color: Colors.black),
        title:
            Text(context.tr.notification, style: context.textTheme.headline6),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      isScrollable: false,
      body: Center(child: Text(context.tr.noNotificationMsg)),
    );
  }
}
