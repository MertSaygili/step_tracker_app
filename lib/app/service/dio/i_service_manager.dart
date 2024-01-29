import 'package:dio/dio.dart';

abstract class IServiceManager {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response<T>> post<T>(
    String path,
    dynamic data,
    Options? options,
    Map<String, dynamic> paramaters,
  );

  Future<Response<T>> put<T>(
    String path,
    dynamic data,
    Options? options,
    Map<String, dynamic> paramaters,
  );

  Future<Response<T>> delete<T>(
    String path,
    dynamic data,
    Options? options,
    Map<String, dynamic> paramaters,
  );

  Future<Response<T>> patch<T>(
    String path,
    Map<String, dynamic> paramaters,
    Options? options,
  );
}
