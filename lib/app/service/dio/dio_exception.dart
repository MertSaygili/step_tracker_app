// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
      case DioExceptionType.badResponse:
        message = _handleError(dioError.response?.statusCode, dioError.response?.data);
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
      case DioExceptionType.connectionError:
        if (dioError.message == 'SocketException') {
          message = 'No Internet';
          break;
        }
        message = 'Unexpected error occurred';
      case DioExceptionType.unknown:
        if (dioError.message == 'SocketException') {
          message = 'No Internet';
          break;
        }
        message = 'Unexpected error occurred';
      case DioExceptionType.badCertificate:
        message = 'Bad certificate';
    }
  }
  late String message;

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'].toString();
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
