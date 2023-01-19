import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/custom_scaffold.layout.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/dialog.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/image_network.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localDataSource = ref.watch(localDataSourceProvider);

    return CustomScaffoldLayout(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(context.tr.settings, style: context.textTheme.headline6),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SettingButton(
            title:
                '${localDataSource.user.firstName} ${localDataSource.user.lastName}',
            subTitle: localDataSource.user.email,
            leading: CircleAvatar(
              backgroundColor: context.theme.cardColor,
              child: customImageNetwork(
                  image: localDataSource.user.image,
                  token: localDataSource.authToken),
            ),
            trealing: const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.black),
            onTap: () => context.go.pushNamed(RouteName.profile),
          ),
          SettingButton(
            title: context.tr.changeLanguage,
            subTitle: context.tr.changeLanguageMsg,
            onTap: () => context.go.pushNamed(RouteName.language),
          ),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: FormBuilderSwitch(
                name: 'notification',
                initialValue: true,
                title: Text(
                  context.tr.notification,
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: FormBuilderSwitch(
                name: 'logOut',
                title: Text(
                  context.tr.logout,
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                onChanged: (v) {
                  yesNoDialog(
                    context,
                    content: context.tr.logoutMsg,
                    onConfirm: () {
                      // ref.read()
                      ref.read(localDataSourceProvider).clear();
                      signInStateListenable.value = localDataSource.isSignedIn;
                    },
                  );
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  final String title;
  String? subTitle;
  Widget? leading;
  Widget? trealing;
  void Function()? onTap;
  SettingButton(
      {super.key,
      required this.title,
      this.leading,
      this.subTitle,
      this.onTap,
      this.trealing});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: kDefaultRaduis),
        onTap: onTap,
        leading: leading,
        title: Text(
          title,
          style: context.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        subtitle: subTitle != null
            ? Text(subTitle!, style: context.textTheme.subtitle2)
            : null,
        trailing: trealing,
      ),
    );
  }
}
