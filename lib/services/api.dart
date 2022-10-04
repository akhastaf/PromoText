import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Api extends GetxService {
  late Dio _dio;
  String? _accessToken
   =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1hbmFnZXIxQG1hbmFnZXIuY29tIiwic3ViIjo1LCJpYXQiOjE2NjQ4Nzc0NzEsImV4cCI6MTY2NDg3ODY3MX0.6kcXib0a4tYKsJjQSypj3DO4fjVbpcGBxwRGD0dt6Ew';

  late CookieJar _cookieJar;

  Api();

  Dio get DioClient => _dio;

  Future<Api> init() async {
    // Init Dio
    _dio = Dio(BaseOptions(baseUrl: 'https://98b9-105-67-7-105.eu.ngrok.io'));
    // Setup cookies
    String appDoc = await getDocPath();
    _cookieJar = PersistCookieJar(storage: FileStorage('${appDoc}/.cookies'));
    _dio.interceptors.add(CookieManager(_cookieJar));
    // Setup the auth interceptors
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (optins, handler) async {
      optins.headers['Authorization'] =
          'Bearer ${_accessToken}'; 
      return handler.next(optins);
    }, onError: (DioError error, handler) async {
      if (error.response?.statusCode == 401 &&
          error.response?.data['message'] == 'Unauthorized') {
          await refreshToken();
          return handler.resolve(await _retry(error.requestOptions));
      }
      return handler.next(error);
    }));
    return this;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(requestOptions.path,
        queryParameters: requestOptions.queryParameters, options: options);
  }

  Future<void> refreshToken() async {
    final response = await _dio.get('/auth/refresh_token');
    if (response.statusCode == 200) {
      _accessToken = response.data['access_token'];
      // await _storage.write(
      //     key: 'accessToken', value: response.data['access_token']);
    } else {
      await _cookieJar.deleteAll();
    }
  }

  Future<String> getDocPath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    return appDocDir.path;
  }
}
