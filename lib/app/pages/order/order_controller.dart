import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer_flutter/app/dto/order_dto.dart';
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

  void incrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];
    orders[index] = order.copyWith(amount: order.amount + 1);
    emit(
        state.copyWith(orderProducts: orders, status: OrderStatus.updateOrder));
  }

  void decrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];
    final amount = order.amount;
    if (amount == 1) {
      if (state.status != OrderStatus.confirmRemoveProduct) {
        emit(OrderConfirmDeleteProductState(
            orderProduct: order,
            index: index,
            status: OrderStatus.confirmRemoveProduct,
            orderProducts: state.orderProducts,
            paymentType: state.paymentType,
            errorMessage: state.errorMessage));
        return;
      } else {
        orders.removeAt(index);
      }
    } else {
      orders[index] = order.copyWith(amount: order.amount - 1);
    }
    if (orders.isEmpty) {
      emit(state.copyWith(status: OrderStatus.emptyBag));
      return;
    }
    emit(
        state.copyWith(orderProducts: orders, status: OrderStatus.updateOrder));
  }

  void cancelDeleteProcess() {
    emit(state.copyWith(status: OrderStatus.loaded));
  }

  void emptyBag() {
    emit(state.copyWith(status: OrderStatus.emptyBag));
  }

  Future<void> saveOrder({
    required String address,
    required String document,
    required int paymentMethodId,
  }) async {
    emit(state.copyWith(status: OrderStatus.loading));

    try {
      await _orderRepository.saveOrder(
        OrderDto(
          products: state.orderProducts,
          address: address,
          document: document,
          paymentMethodId: paymentMethodId,
        ),
      );
      emit(state.copyWith(status: OrderStatus.success));
    } catch (e, s) {
      log('Erro ao salvar pedido', error: e, stackTrace: s);

      emit(
        state.copyWith(
          status: OrderStatus.error,
          errorMessage: 'Erro ao salvar pedido',
        ),
      );
    }
  }
}
