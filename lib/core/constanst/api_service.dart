import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = "https://ecommerce.routemisr.com/api/v1/";
  final Dio dio;

  ApiService({required this.dio});

  /// GET
  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(
        "$baseUrl$endpoint",
        queryParameters: query,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// POST
  Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.post("$baseUrl$endpoint", data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// PUT
  Future<Map<String, dynamic>> put({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.put("$baseUrl$endpoint", data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// DELETE
  Future<Map<String, dynamic>> delete({required String endpoint}) async {
    try {
      final response = await dio.delete("$baseUrl$endpoint");
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Error handler (private)
  Exception _handleDioError(DioException e) {
    if (e.response != null) {
      final data = e.response?.data;
      if (data is Map<String, dynamic> && data['message'] != null) {
        return Exception(data['message']);
      }
      return Exception("Server error");
    } else {
      return Exception("No internet connection");
    }
  }
}
