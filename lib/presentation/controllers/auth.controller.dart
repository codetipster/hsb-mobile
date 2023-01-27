import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/config/app.router.dart';
import 'package:invoice_tracking_flutter/core/errors/app.failure.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:invoice_tracking_flutter/data/datasources/remote/remote.datasource.dart';
import 'package:invoice_tracking_flutter/data/entities/user.entity.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/async_value_extension.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<UserEntity?>>((ref) {
  return AuthController(
    remoteDataSource: ref.watch(remoteDataSourceProvider),
    localDataSource: ref.watch(localDataSourceProvider),
  );
});

class AuthController extends StateNotifier<AsyncValue<UserEntity?>> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  AuthController({
    required this.remoteDataSource,
    required this.localDataSource,
  }) : super(const AsyncData(null));

  Future<void> initialize() async {
    signInStateListenable.value = localDataSource.isSignedIn;
    onBoardStateListenable.value = localDataSource.showOnBoard;
  }

  Future<void> signIn(BuildContext context,
      {required Map<String, dynamic>? formData}) async {
    state = const AsyncLoading();
    final result = await remoteDataSource.signIn(data: formData!);
    result.when(success: (data) {
      state = const AsyncData(null);
      initialize();
    }, failure: (failure) {
      state = const AsyncData(null);
      state.showFlushBarOnError(context,
          error: AppFailure.getFailureMessage(failure));
    });
  }

  Future<void> sendOtp(BuildContext context,
      {required Map<String, dynamic>? formData}) async {
    state = const AsyncLoading();
    final result = await remoteDataSource.sendOTP(formData: formData!);
    result.when(success: (data) {
      state = const AsyncData(null);
      context.go.pushNamed(RouteName.otpScreen);
    }, failure: (failure) {
      state = const AsyncData(null);
      state.showFlushBarOnError(context,
          error: AppFailure.getFailureMessage(failure));
    });
  }

  Future<void> updatePassword(BuildContext context,
      {required Map<String, dynamic>? formData}) async {
    state = const AsyncLoading();
    final result = await remoteDataSource.updatePassword(data: formData!);
    result.when(success: (data) {
      state = const AsyncData(null);
      context.go.pushReplacementNamed(RouteName.signIn);
    }, failure: (failure) {
      state = const AsyncData(null);
      state.showFlushBarOnError(context,
          error: AppFailure.getFailureMessage(failure));
    });
  }
}
