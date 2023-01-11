import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice_tracking_flutter/presentation/screens/auth/create_password/create_password.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/auth/forget_password/forget_password.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/auth/otp/otp.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/auth/sign_in/signin.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/employee/add_employee.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/employee/edit_employee.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/home/employees.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/home/invoices.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/home/reports.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/language.dart';
import 'package:invoice_tracking_flutter/presentation/screens/main.layout.dart';
import 'package:invoice_tracking_flutter/presentation/screens/notification/notification.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/onboarding/onboard.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/profile/profile.screen.dart';

/// Provides a [ValueNotifier] to the app router to redirect on auth state change
final signInStateListenable = ValueNotifier<bool>(false);
final onBoardStateListenable = ValueNotifier<bool>(false);

class RouteName {
  static const String initial = 'layout';
  static const String onBoard = 'on_board';
  static const String signIn = '/sign_in';

  static const String invoices = 'invoices';
  static const String reports = 'reports';
  static const String employees = 'employees';
  static const String addEmployee = 'add_employee';
  static const String editEmployee = 'edit_employee';
  static const String profile = 'profile';
  static const String notification = 'notification';
  static const String language = 'language';
}

class RoutePath {
  static const String initial = '/layout';
  static const String onBoard = '/on_board';
  static const String signIn = '/sign_in';

  static const String invoices = 'invoices';
  static const String reports = 'reports';
  static const String employees = 'employees';
  static const String addEmployee = 'add_employee';
  static const String editEmployee = 'edit_employee';
  static const String profile = 'profile';
  static const String notification = 'notification';
  static const String language = 'language';
//
  static const String forgetPasswordScreen = '/forget_password';
  static const String createPasswordScreen = '/create_password';
  static const String otpScreen = '/otp';
  static const String settingScreen = '/setting';
  static const String profileScreen = '/profile';
  static const String addEmployeeScreen = '/add_mployee';
}

final router = GoRouter(
    initialLocation: RoutePath.initial,
    routes: [
      // top-level route
      GoRoute(
          name: RouteName.initial,
          path: RoutePath.initial,
          builder: (context, state) => const AppLayout(),
          routes: [
            GoRoute(
              name: RouteName.invoices,
              path: RoutePath.invoices,
              builder: (context, state) => const InvoicesScreen(),
            ),
            GoRoute(
              name: RouteName.reports,
              path: RoutePath.reports,
              builder: (context, state) => const ReportsScreen(),
            ),
            GoRoute(
              name: RouteName.notification,
              path: RoutePath.notification,
              builder: (context, state) => const NotificationScreen(),
            ),
            GoRoute(
              name: RouteName.employees,
              path: RoutePath.employees,
              builder: (context, state) => const EmployeesScreen(),
              routes: [
                GoRoute(
                  name: RouteName.addEmployee,
                  path: RoutePath.addEmployee,
                  builder: (context, state) => AddEmployeeScreen(),
                ),
                GoRoute(
                  name: RouteName.editEmployee,
                  path: RoutePath.editEmployee,
                  builder: (context, state) => EditEmployeeScreen(
                      formData: state.extra as Map<String, dynamic>),
                ),
              ],
            ),
            GoRoute(
              name: RouteName.profile,
              path: RoutePath.profile,
              builder: (context, state) => ProfileScreen(),
            ),
            GoRoute(
              name: RouteName.language,
              path: RoutePath.language,
              builder: (context, state) => LanguageScreen(),
            ),
          ]),
      GoRoute(
        name: RouteName.signIn,
        path: RoutePath.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: RouteName.onBoard,
        path: RoutePath.onBoard,
        builder: (context, state) => const OnBoardScreen(),
      ),
    ],
    observers: [routeObserver],
    redirect: (context, state) {
      final isSignedIn = signInStateListenable.value;
      final showOnBoard = onBoardStateListenable.value;

      if (isSignedIn && !state.location.contains(RoutePath.initial)) {
        return RoutePath.initial;
      }
      if (!isSignedIn && !showOnBoard) return RoutePath.onBoard;
      if (!isSignedIn && showOnBoard) return RoutePath.signIn;

      return null;
    },
    refreshListenable: signInStateListenable,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => Scaffold(
          body: Center(child: Text(state.error.toString())),
        ));

/// Route observer to use with RouteAware
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
