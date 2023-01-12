import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';

final bottomNavigatonMenuProvider =
    StateProvider<NavigatorMenu>((ref) => NavigatorMenu.home);

enum NavigatorMenu {
  home,
  messages,
  settings,
  contact,
}

class CustomBottomNavigatorBar extends ConsumerWidget {
  const CustomBottomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorMenu = ref.watch(bottomNavigatonMenuProvider);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 15,
            color: const Color.fromARGB(255, 231, 229, 229).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset(
                AppConst.homeIcon,
                color: navigatorMenu == NavigatorMenu.home
                    ? Colors.white
                    : Colors.white30,
              ),
              onPressed: () {
                ref.read(bottomNavigatonMenuProvider.notifier).state =
                    NavigatorMenu.home;
              },
            ),
            IconButton(
              icon: Image.asset(
                AppConst.messagesIcon,
                color: navigatorMenu == NavigatorMenu.messages
                    ? Colors.white
                    : Colors.white30,
              ),
              onPressed: () {
                ref.read(bottomNavigatonMenuProvider.notifier).state =
                    NavigatorMenu.messages;
              },
            ),
            IconButton(
              icon: Image.asset(
                AppConst.settingsIcon,
                color: navigatorMenu == NavigatorMenu.settings
                    ? Colors.white
                    : Colors.white30,
              ),
              onPressed: () {
                ref.read(bottomNavigatonMenuProvider.notifier).state =
                    NavigatorMenu.settings;
              },
            ),
            IconButton(
              icon: Image.asset(
                AppConst.contactUsIcon,
                color: navigatorMenu == NavigatorMenu.contact
                    ? Colors.white
                    : Colors.white30,
              ),
              onPressed: () {
                ref.read(bottomNavigatonMenuProvider.notifier).state =
                    NavigatorMenu.contact;
              },
            ),
          ],
        ),
      ),
    );
  }
}
