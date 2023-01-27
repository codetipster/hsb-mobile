import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/core/errors/app.failure.dart';
import 'package:invoice_tracking_flutter/data/datasources/remote/remote.datasource.dart';
import 'package:invoice_tracking_flutter/data/entities/employee.entity.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/async_value_extension.dart';
import 'package:invoice_tracking_flutter/presentation/extensions/ui_extension.dart';

final employeeControllerProvider =
    StateNotifierProvider<EmployeeController, AsyncValue<List<EmployeeEntity>>>(
        (ref) {
  return EmployeeController(
      remoteDataSource: ref.watch(remoteDataSourceProvider))
    ..initialize();
});

class EmployeeController
    extends StateNotifier<AsyncValue<List<EmployeeEntity>>> {
  final RemoteDataSource remoteDataSource;
  EmployeeController({required this.remoteDataSource})
      : super(const AsyncData([]));

  Future<void> initialize() async {
    await getEmployees();
  }

  Future<void> getEmployees() async {
    state = const AsyncLoading();
    final result = await remoteDataSource.getEmployees();
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

  Future<void> createEmployee(BuildContext context,
      {required Map<String, dynamic> data}) async {
    state = const AsyncLoading();
    final result = await remoteDataSource.createEmployee(formData: data);
    result.when(
      success: (data) {
        state = const AsyncData([]);
        state.showFlushBarOnSuccess(context,
            success: 'Employee request sent successfully!');
        initialize();
      },
      failure: (failure) {
        state = AsyncError(
            AppFailure.getFailureMessage(failure), StackTrace.current);
      },
    );
  }

  Future<void> updateEmployee(BuildContext context,
      {required Map<String, dynamic> data, required String id}) async {
    final result =
        await remoteDataSource.updateEmployee(id: id, formData: data);
    result.when(
      success: (data) {
        state = const AsyncData([]);
        state.showFlushBarOnSuccess(context,
            success: 'Employee updated successfully!');
        initialize();
      },
      failure: (failure) {
        state = AsyncError(
            AppFailure.getFailureMessage(failure), StackTrace.current);
      },
    );
  }
}
