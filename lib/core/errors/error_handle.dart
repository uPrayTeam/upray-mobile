import 'package:dio/dio.dart';
import 'package:upray_mobile/core/errors/failure.dart';
import 'package:upray_mobile/core/logger/logger.dart';
import 'package:upray_mobile/injection_container.dart';

Failure handleError(
  final dynamic error,
  final Failure defaultFailure, {
  final bool isAuthorization = false,
}) {
  sl<Logger>().error(defaultFailure.toString());

  if (error is DioException) {
    return defaultFailure;
  }

  if (error is Failure) {
    return error;
  } else if (error is DioException) {
    if (error.error is Failure) {
      return error.error as Failure;
    }
  }

  return defaultFailure;
}
