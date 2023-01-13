import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/core/api/dio.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/auth.controller.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/notification.controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/config/app.locale.dart';
import '/config/app.theme.dart';

///
/// Exposes [SharedPreferences] instance
final sharedPreferencesProvider =
    FutureProvider((ref) => SharedPreferences.getInstance());

/// Exposes [DioHttpClient] instance
final dioProvider = Provider<Dio>((ref) => AppDio.getInstance());

///
/// Provides a [ChangeNotifierProvider] to the app `theme` to update theme
/// mode on [isDarkMode] state change
final themeStateProvider = ChangeNotifierProvider<AppTheme>(
    (ref) => AppTheme(ref.watch(sharedPreferencesProvider).asData!.value));

/// Provides a [ChangeNotifierProvider] to the app `locale` to
/// change app's current lang
final localeStateProvider = ChangeNotifierProvider<AppLocale>(
    (ref) => AppLocale(ref.watch(sharedPreferencesProvider).asData!.value));

//? Initialize all the services that must be intialized when the application is lunched
/// (e.g., Loads and parses the `SharedPreferences` for this app).
///
/// You can add initialization of other features
/// (if some feature should be initialized at the beginning of the app),
/// for example - `authorization`
/// ```
/// container.read(authControllerProvider);
/// ```
///
Future<void> initializeProviders(ProviderContainer container) async {
  //? Core
  await container.read(sharedPreferencesProvider.future);

  //? Auth Feature

  // await container.read(localDataSourceProvider).clear();
  await container.read(authControllerProvider.notifier).initialize();

  //? Notification Feature
  await container.read(notificationServiceProvider.notifier).initialize();
  
  //! Config
  // load theme configs before the app started
  await container.read(themeStateProvider).initialize();
}
