import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:vakinha_burguer_flutter/app/core/config/env/env.dart';
import 'package:vakinha_burguer_flutter/app/core/config/rest/auth_interceptor.dart';

class CustomDio extends DioForNative {
  late AuthInterceptor _authInterceptors;
  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.i['backend_base_url'] ?? '',
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true, requestHeader: true));
    _authInterceptors = AuthInterceptor();
  }
  CustomDio auth() {
    interceptors.add(_authInterceptors);
    return this;
  }

  CustomDio unAuth() {
    interceptors.remove(_authInterceptors);
    return this;
  }
}
