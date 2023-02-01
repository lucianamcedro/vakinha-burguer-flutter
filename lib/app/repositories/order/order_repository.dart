import 'package:vakinha_burguer_flutter/app/models/payment_type_model.dart';

abstract class OrderRepository {
  Future<List<PaymentTypeModel>> getAllPaymentsType();
}
