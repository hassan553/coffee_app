import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromResponse({
    required int statusCode,
    required String message,
  }) {
    switch (statusCode) {
      case 400:
        return ServerFailure('Bad Request');
      case 401:
        return ServerFailure('Unauthorized');
      case 403:
        return ServerFailure('Forbidden');
      case 404:
        return ServerFailure('Not Found');
      case 408:
        return ServerFailure('Request Timeout');
      case 500:
        return ServerFailure('Internal Server Error');
      case 502:
        return ServerFailure('Bad Gateway');
      case 503:
        return ServerFailure('Service Unavailable');
      case 504:
        return ServerFailure('Gateway Timeout');
      default:
        return ServerFailure('Unexpected Error: $statusCode');
    }
  }
}

class NoInternetFailure extends Failure {
  NoInternetFailure(super.message);
}
