// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vakinha_burguer_flutter/app/core/config/rest/custom_dio.dart';
import 'package:vakinha_burguer_flutter/app/core/exceptions/repository_exception.dart';
import 'package:vakinha_burguer_flutter/app/models/payment_type_model.dart';

import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;
  OrderRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<PaymentTypeModel>> getAllPaymentsType() async {
    try {
      final result = await dio.auth().get('/payment-types');
      return result.data
          .map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log(
        'Erro ao buscar formas de pagamento',
        error: e,
        stackTrace: s,
      );
      throw RepositoryException(message: 'Erro ao buscar formas de pagamento');
    }
  }
}
