import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:step_tracker_app/app/env/env.dart';
import 'package:step_tracker_app/app/service/dio/i_service_manager.dart';

final class ServiceManager implements IServiceManager {
  ServiceManager() {
    final baseOptions = BaseOptions(
      baseUrl: Env.logBaseUrl,
    );

    _dio = Dio(baseOptions);

    _dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: false));
  }
  static late final Dio _dio;

  // GET
  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
    return response;
  }

  // POST
  @override
  Future<Response<T>> post<T>(
    String path,
    dynamic data,
    Options? options,
    Map<String, dynamic> paramaters,
  ) async {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: paramaters,
      onReceiveProgress: (count, total) {},
      options: options,
    );
  }

  // PUT
  @override
  Future<Response<T>> put<T>(
    String path,
    dynamic data,
    Options? options,
    Map<String, dynamic> paramaters,
  ) async {
    return _dio.put<T>(
      path,
      queryParameters: paramaters,
    );
  }

  // DELETE
  @override
  Future<Response<T>> delete<T>(
    String path,
    dynamic data,
    Options? options,
    Map<String, dynamic> paramaters,
  ) async {
    return _dio.delete<T>(
      path,
      queryParameters: paramaters,
    );
  }

  // PATCH
  @override
  Future<Response<T>> patch<T>(
    String path,
    Map<String, dynamic> paramaters,
    Options? options,
  ) async {
    return _dio.patch<T>(
      path,
      queryParameters: paramaters,
    );
  }
}
