import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:toonder_app/model/banner_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.toonder.vn/wecomi/api/book';
  final String _urlHot = 'https://api.toonder.vn/wecomi/api/hot';

  Future<dynamic> get(String path) async {
    try {
      Response<dynamic> response = await _dio.get('$_url/$path');
      return response;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      return BookBanner.withDes("des");
    }
  }

  Future<dynamic> getHot(String path) async {
    try {
      Response<dynamic> response = await _dio.get('$_urlHot/$path');
      return response;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      throw Exception("Can't get api");
    }
  }

  Future<dynamic> post(String path, dynamic body) async {
    try {
      Response<dynamic> response = await _dio.post('$_url/$path', data: body);
      return response;
    } catch (error) {
      throw Exception('Can\'t post api');
    }
  }
}
