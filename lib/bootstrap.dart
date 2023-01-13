import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:invoice_tracking_flutter/config/logger.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/app.service.dart' as providers;

/// Initializes `services` and `dependencies` before the start of the application
Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );

  final container = ProviderContainer(
    overrides: [],
    observers: [Logger()],
  );
  // Initialize all providers
  await providers.initializeProviders(container);

  return container;
}
