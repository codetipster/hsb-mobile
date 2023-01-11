import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/core/errors/app.failure.dart';
import 'package:invoice_tracking_flutter/data/datasources/remote/remote.datasource.dart';
import 'package:invoice_tracking_flutter/data/entities/invoice.entity.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/async_value_extension.dart';

final invoiceControllerProvider =
    StateNotifierProvider<InvoiceController, AsyncValue<List<InvoiceEntity>>>(
        (ref) {
  return InvoiceController(
      remoteDataSource: ref.watch(remoteDataSourceProvider))
    ..initialize();
});

class InvoiceController extends StateNotifier<AsyncValue<List<InvoiceEntity>>> {
  final RemoteDataSource remoteDataSource;
  InvoiceController({required this.remoteDataSource})
      : super(const AsyncData([]));

  Future<void> initialize() async {
    await getInvoices();
  }

  Future<void> getInvoices() async {
    state = const AsyncLoading();
    final result = await remoteDataSource.getInvoices();
    result.when(
      success: (data) {
        state = AsyncData(data);
      },
      failure: (failure) {
        state = AsyncError(
            AppFailure.getFailureMessage(failure), StackTrace.current);
      },
    );
  }

  Future<void> uploadInvoice(
    BuildContext context, {
    required String name,
    required File image,
  }) async {
    final result =
        await remoteDataSource.uploadInvoice(name: name, image: image);
    result.when(
      success: (data) {
        state.showFlushBarOnSuccess(context,
            success: 'Your invoice has been submitted');
        initialize();
      },
      failure: (failure) {
        state = const AsyncData([]);
        state.showFlushBarOnError(context,
            error: AppFailure.getFailureMessage(failure));
      },
    );
  }
}
