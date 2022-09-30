import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cookie_jar/cookie_jar.dart';

class Api {
  Dio dio =
      Dio(BaseOptions(baseUrl: 'https://e08b-197-230-240-146.eu.ngrok.io'));
  //CookieJar cookieJar = PersistCookieJar();
  String? accessToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1hbmFnZXIxQG1hbmFnZXIuY29tIiwic3ViIjo1LCJpYXQiOjE2NjQ1NzE2NjksImV4cCI6MTY2NDY1ODA2OX0.9BON_kdFzdkKnx36xkKpP5V7Ls6jmUei2iiqAgqwhz4';

  final _storage = const FlutterSecureStorage();

  // Dio get api () => api;

  Api() {
    //dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (optins, handler) async {
      optins.headers['Autorization'] = 'Bearer $accessToken';
      print(optins.headers['Athorization']);
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
    return dio.request<dynamic>(requestOptions.path,
        queryParameters: requestOptions.queryParameters, options: options);
  }

  Future<void> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    final response = await dio.get('/auth/refresh_token');
    if (response.statusCode == 200) {
      accessToken = response.data;
    } else {
      accessToken = null;
      //cookieJar.deleteAll();
    }
  }
}
