import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/core/errors/app.failure.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:invoice_tracking_flutter/data/datasources/remote/remote.datasource.dart';
import 'package:invoice_tracking_flutter/data/entities/user.entity.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/async_value_extension.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, AsyncValue<UserEntity?>>((ref) {
  return ProfileController(
    remoteDataSource: ref.watch(remoteDataSourceProvider),
    localDataSource: ref.watch(localDataSourceProvider),
  );
});

class ProfileController extends StateNotifier<AsyncValue<UserEntity?>> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ProfileController({
    required this.remoteDataSource,
    required this.localDataSource,
  }) : super(const AsyncData(null));

  Future<void> initialize() async {}

  Future<void> updateProfile(BuildContext context,
      {required Map<String, dynamic>? formData, required File? image}) async {
    state = const AsyncLoading();
    final result =
        await remoteDataSource.uploadProfile(formData: formData!, image: image);
    result.when(success: (data) {
      state = AsyncData(data);
      state.showFlushBarOnSuccess(context,
          success: 'Profile has been updated successfuly');
    }, failure: (failure) {
      state = const AsyncData(null);
      state.showFlushBarOnError(context,
          error: AppFailure.getFailureMessage(failure));
    });
  }
}
