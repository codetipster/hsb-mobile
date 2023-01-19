import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/image.controller.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/profile.controller.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';
import 'package:invoice_tracking_flutter/presentation/screens/profile/widgets/profile_fields.dart';
import 'package:invoice_tracking_flutter/presentation/widgets/avatar_pic.dart';

class ProfileScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localDataSource = ref.watch(localDataSourceProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: context.colorScheme.onBackground,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(context.tr.editProfile, style: context.textTheme.headline6),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingH),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AvatarPic(),
              kDefaultSpaceV,
              _buildForm(context, localDataSource),
              _buildConfirmButton(context, ref),
              kDefaultSpaceV,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, LocalDataSource localDataSource) {
    return FormBuilder(
      key: _formKey,
      initialValue: localDataSource.user.toJson(),
      child: profileFields(context),
    );
  }

  Widget _buildConfirmButton(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: ref.watch(profileControllerProvider).maybeWhen(
            orElse: () => null,
            data: (data) => () {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                ref.read(profileControllerProvider.notifier).updateProfile(
                      context,
                      formData: _formKey.currentState?.value,
                      image: ref.watch(imageControllerProvider).image,
                    );
              }
            },
          ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          double.maxFinite,
          8.h,
        ),
      ),
      child: ref.watch(profileControllerProvider).when(
            data: (data) => Text(context.tr.save),
            error: (e, s) => null,
            loading: () => const CircularProgressIndicator(),
          ),
    );
  }
}
