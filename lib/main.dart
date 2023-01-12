import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/app.dart';
import 'package:invoice_tracking_flutter/bootstrap.dart';

void main() async {
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: const InvoiceTrackingApp(),
    ),
  );
}
