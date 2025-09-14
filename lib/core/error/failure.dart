import 'package:dio/dio.dart';
import 'failure.dart';

class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('No internet connection');
}

class DioFailure extends Failure {
  const DioFailure()
      : super('There is Internal Error Right Now Please Try Again Later');
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

Failure handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.unknown: // usually when offline
      return const NetworkFailure();

    case DioExceptionType.badResponse: // server returned 4xx/5xx
      final message = e.response?.data['status_message'] ?? 'Server error';
      return ServerFailure(message);

    case DioExceptionType.cancel:
      return const ServerFailure('Request was cancelled');

    case DioExceptionType.badCertificate:
      return const ServerFailure('Bad certificate');

    case DioExceptionType.connectionError:
      return const NetworkFailure();

    default:
      return ServerFailure(e.toString());
  }
}
