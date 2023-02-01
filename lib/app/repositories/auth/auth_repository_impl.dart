// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vakinha_burguer_flutter/app/core/config/rest/custom_dio.dart';
import 'package:vakinha_burguer_flutter/app/core/exceptions/repository_exception.dart';
import 'package:vakinha_burguer_flutter/app/core/exceptions/unauthorized_exception.dart';
import 'package:vakinha_burguer_flutter/app/models/auth_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;
  AuthRepositoryImpl({
    required this.dio,
  });
  @override
  Future<AuthModel> login(String email, String paswword) async {
    try {
      final result = await dio.unAuth().post('/auth', data: {
        'email': email,
        'password': paswword,
      });
      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 403) {
        log(
          'Permissão negada',
          error: e,
          stackTrace: s,
        );
        throw UnauthorizedException();
      }
      log(
        'Erro ao realizar login',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(message: 'Erro ao relizar login');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.unAuth().post('/users', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioError catch (e, s) {
      log(
        'Erro ao registrar usuário',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(message: 'Erro ao registrar usuário');
    }
  }
}
