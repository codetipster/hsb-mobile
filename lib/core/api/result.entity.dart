import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invoice_tracking_flutter/core/errors/app.failure.dart';

part 'result.entity.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success({required T data}) = Success<T>;
  const factory Result.failure({required AppFailure failure}) = Failure<T>;

  static Result<T> guard<T>(T Function() body) {
    try {
      return Result.success(data: body());
    } on Exception catch (error) {
      return Result.failure(failure: AppFailure.getFailure(error));
    }
  }

  static Future<Result<T>> guardFuture<T>(Future<T> Function() future) async {
    try {
      return Result.success(data: await future());
    } on Exception catch (error) {
      return Result.failure(failure: AppFailure.getFailure(error));
    }
  }
}
