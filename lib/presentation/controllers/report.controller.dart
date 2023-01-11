import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/core/errors/app.failure.dart';
import 'package:invoice_tracking_flutter/data/datasources/remote/remote.datasource.dart';
import 'package:invoice_tracking_flutter/data/entities/report.entity.dart';

final reportControllerProvider =
    StateNotifierProvider<ReportController, AsyncValue<List<ReportEntity>>>(
        (ref) {
  return ReportController(remoteDataSource: ref.watch(remoteDataSourceProvider))
    ..initialize();
});

class ReportController extends StateNotifier<AsyncValue<List<ReportEntity>>> {
  final RemoteDataSource remoteDataSource;
  ReportController({required this.remoteDataSource})
      : super(const AsyncData([]));

  Future<void> initialize() async {
    await getReports();
  }

  Future<void> getReports() async {
    final result = await remoteDataSource.getReports();
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
}
