import 'package:vakinha_burguer_flutter/app/dto/order_dto.dart';
import 'package:vakinha_burguer_flutter/app/models/payment_type_model.dart';

abstract class OrderRepository {
  Future<List<PaymentTypeModel>> getAllPaymentsType();
  Future<void> saveOrder(OrderDto order);
}
