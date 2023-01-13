import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/presentation/screens/contact/contact_us.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/home/home.screen.dart';
import 'package:invoice_tracking_flutter/presentation/screens/profile/setting.screen.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/bottom_navigation_bar.dart';
class AppLayout extends ConsumerWidget {
  const AppLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigatorBar(),
      body: _buildScaffoldBody(ref),
    );
  }

  Widget _buildScaffoldBody(WidgetRef ref) {
    final bottomNavigationMenu = ref.watch(bottomNavigatonMenuProvider);

    switch (bottomNavigationMenu) {
      case NavigatorMenu.home:
        return const HomeScreen();
      case NavigatorMenu.messages:
        return const Scaffold(
          body: Center(
            child: Text('Coming soon'),
          ),
        );
      case NavigatorMenu.settings:
        return const SettingScreen();
      case NavigatorMenu.contact:
        return const ContactUs();
    }
  }
}
