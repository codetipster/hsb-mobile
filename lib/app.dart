import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:sizer/sizer.dart';

import '/l10n/app_localizations.dart';
import '/config/app.service.dart';

class InvoiceTrackingApp extends ConsumerStatefulWidget {
  const InvoiceTrackingApp({super.key});
  @override
  InvoiceTrackingAppState createState() => InvoiceTrackingAppState();
}

class InvoiceTrackingAppState extends ConsumerState<InvoiceTrackingApp>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint('[APP STATE] resumed');
        break;
      case AppLifecycleState.inactive:
        debugPrint('[APP STATE] inactive');
        break;
      case AppLifecycleState.paused:
        debugPrint('[APP STATE] paused');
        break;
      case AppLifecycleState.detached:
        debugPrint('[APP STATE] detached');
        break;
    }
  }

  Future<void> initApp() async {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  initState() {
    super.initState();
    initApp().then((value) => debugPrint('[APP] Init Completed'));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeStateProvider);
    final localeState = ref.watch(localeStateProvider);
    final localDataSource = ref.watch(localDataSourceProvider);

    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp.router(
        title: 'InvoiceTracking App',
        debugShowCheckedModeBanner: false,
        theme: themeState.lightTheme,
        darkTheme: themeState.darkTheme,
        themeMode: themeState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        locale: Locale(localeState.currentLangauge),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
