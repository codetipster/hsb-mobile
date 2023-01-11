import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice_tracking_flutter/l10n/app_localizations.dart';

/// A set of useful [BuildContext] extensions
extension BuildContextX on BuildContext {
  /// Extensions for quickly accessing generated localization getters
  AppLocalizations get tr => AppLocalizations.of(this)!;

  /// Extension for quickly accessing app [ColorScheme]
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Extension for quickly accessing app [TextTheme]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Extension for quickly accessing app [Theme]
  ThemeData get theme => Theme.of(this);

  /// Extension for quickly accessing screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Extension for quickly accessing screen size
  GoRouter get go => GoRouter.of(this);
}
