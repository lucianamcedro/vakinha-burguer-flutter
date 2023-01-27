// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vakinha_burguer_flutter/app/models/product_model.dart';

class OrderProductDto {
  final ProductModel productModel;
  final int amout;
  OrderProductDto({
    required this.productModel,
    required this.amout,
  });

  double get totalPrice => amout * productModel.price;
}