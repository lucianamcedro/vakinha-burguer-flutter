import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer_flutter/app/dto/order_product_dto.dart';
import 'package:vakinha_burguer_flutter/app/pages/order/order_state.dart';
import 'package:vakinha_burguer_flutter/app/repositories/order/order_repository.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;
  OrderController(this._orderRepository) : super(const OrderState.initial());

  void load(List<OrderProductDto> products) async {
    try {
      final paymentTypes = await _orderRepository.getAllPaymentsType();
      emit(state.copyWith(
        orderProducts: products,
        status: OrderStatus.loading,
        paymentType: paymentTypes,
      ));
    } catch (e, s) {
      log(
        'Erro ao carregar página',
        error: e,
        stackTrace: s,
      );
      emit(state.copyWith(
        status: OrderStatus.error,
        errorMessage: 'Erro ao carregar página',
      ));
    }
  }
}
