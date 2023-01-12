import 'package:flutter/material.dart';
import 'package:invoice_tracking_flutter/config/logger.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/app.service.dart' as providers;

/// Initializes `services` and `dependencies` before the start of the application
Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer(
    overrides: [],
    observers: [Logger()],
  );
  // Initialize all providers
  await providers.initializeProviders(container);

  return container;
}
