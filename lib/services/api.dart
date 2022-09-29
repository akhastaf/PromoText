import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cookie_jar/cookie_jar.dart';

class Api {
  Dio api =
      Dio(BaseOptions(baseUrl: 'https://e4d8-197-230-240-146.eu.ngrok.io'));
  CookieJar cookieJar = PersistCookieJar();
  String? accessToken;

  final _storage = const FlutterSecureStorage();

  Api() {
    api.interceptors.add(CookieManager(cookieJar));
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (optins, handler) async {
      optins.headers['Autorization'] = 'Bearer $accessToken';
      return handler.next(optins);
    }, onError: (DioError error, handler) async {
      if (error.response?.statusCode == 401 &&
          error.response?.data['message'] == 'Unauthorized') {
        if (await _storage.containsKey(key: 'refreshToken')) {
          await refreshToken();
          return handler.resolve(await _retry(error.requestOptions));
        }
      }
      return handler.next(error);
    }));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(requestOptions.path,
        queryParameters: requestOptions.queryParameters, options: options);
  }

  Future<void> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    final response = await api.get('/auth/refresh_token');
    if (response.statusCode == 200) {
      accessToken = response.data;
    } else {
      accessToken = null;
      cookieJar.deleteAll();
    }
  }
}
