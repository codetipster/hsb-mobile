import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app.failure.freezed.dart';

@freezed

/// Represents all app failures
class AppFailure with _$AppFailure {
  const factory AppFailure.requestCancelled() = RequestCancelled;
  const factory AppFailure.unauthorizedRequest(String error) =
      UnauthorizedRequest;
  const factory AppFailure.badRequest(String error) = BadRequest;
  const factory AppFailure.notFound(String error) = NotFound;
  const factory AppFailure.notAcceptable(String error) = NotAcceptable;
  const factory AppFailure.requestTimeout() = RequestTimeout;
  const factory AppFailure.notImplemented() = NotImplemented;
  const factory AppFailure.internalServerError() = InternalServerError;
  const factory AppFailure.noInternetConnection() = NoInternetConnection;
  const factory AppFailure.formatException(String error) = FormatException;
  const factory AppFailure.unableToProcess() = UnableToProcess;
  const factory AppFailure.defaultError(String error) = DefaultError;
  const factory AppFailure.unexpectedError() = UnexpectedError;

  static AppFailure getFailure(error) {
    if (error is Exception) {
      AppFailure appFailure = const AppFailure.defaultError('');
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            appFailure = const AppFailure.requestCancelled();
            break;
          case DioErrorType.response:
            switch (error.response!.statusCode) {
              case 400:
                appFailure = AppFailure.unauthorizedRequest(
                    error.response?.data['message']);
                break;
              case 401:
                appFailure = AppFailure.unauthorizedRequest(
                    error.response?.data['message']);
                break;
              case 403:
                appFailure = AppFailure.unauthorizedRequest(
                    error.response?.data['message']);
                break;
              case 404:
                appFailure = AppFailure.notFound(
                    error.response?.statusMessage ?? "Not found");
                break;
              case 408:
                appFailure = const AppFailure.requestTimeout();
                break;
              case 500:
                appFailure = const AppFailure.internalServerError();
                break;
              default:
                var responseCode = error.response!.statusCode;
                appFailure = AppFailure.defaultError(
                  "Received invalid status code: $responseCode",
                );
            }
            break;
          case DioErrorType.connectTimeout:
            appFailure = AppFailure.defaultError(error.message);
            break;
          case DioErrorType.sendTimeout:
            appFailure = const AppFailure.noInternetConnection();
            break;
          case DioErrorType.receiveTimeout:
            appFailure = const AppFailure.noInternetConnection();
            break;
          case DioErrorType.other:
            // TODO: Handle this case.
            break;
        }
      } else {
        appFailure = const AppFailure.unexpectedError();
      }
      return appFailure;
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const AppFailure.unableToProcess();
      }
    }
    return const AppFailure.unexpectedError();
  }

  static String getFailureMessage(AppFailure failure) {
    return failure.when(
        notImplemented: () => "Not Implemented",
        requestCancelled: () => "Request Cancelled",
        internalServerError: () => "Internal Server Error",
        notFound: (String error) => error,
        badRequest: (String error) => error,
        unexpectedError: () => "Unexpected error occurred",
        requestTimeout: () => "Connection request timeout",
        noInternetConnection: () => "No internet connection",
        unableToProcess: () => "Unable to process the data",
        defaultError: (String error) => error,
        formatException: (String error) => error,
        notAcceptable: (String error) => error,
        unauthorizedRequest: (String error) => error);
  }
}
