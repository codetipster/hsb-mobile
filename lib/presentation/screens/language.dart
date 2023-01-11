import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';

final List appLanguageList = [
  {'icon': 'assets/icons/en.png', 'lang': 'English'},
  {'icon': 'assets/icons/gr.png', 'lang': 'German'},
];

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          // appBar: _buildActivityLogAppBar(context),
          body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Choose your preferred language',
            style: context.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FormBuilderTextField(
              name: 'Search Languages',
              decoration: InputDecoration(
                labelText: 'Search Languages',
                hintText: 'Search Languages',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: appLanguageList.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            itemBuilder: (context, i) {
              return _buildLanguageCard(context, appLanguageList[i], ref);
            },
          ),
        ],
      )),
    );
  }

  Widget _buildLanguageCard(
    BuildContext context,
    Map language,
    WidgetRef ref,
  ) {
    return GestureDetector(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide.none,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Text(
              language['lang'],
              style: context.textTheme.headline6,
            ),
            leading: Image.asset(
              language['icon'],
              width: 60,
            ),
          )),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute<void>(
        //     builder: (BuildContext context) => const SignInPage(),
        //   ),
        // );
      },
    );
  }

  // AppBar _buildActivityLogAppBar(BuildContext context) {
  //   return AppBar(
  //     backgroundColor: Colors.transparent,
  //     title: Text(
  //       context.tr.language,
  //       style: context.textTheme.headline5!
  //           .copyWith(color: context.colorScheme.secondary),
  //     ),
  //     centerTitle: true,
  //   );
  // }
}
