// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';
import 'package:vakinha_burguer_flutter/app/dto/order_product_dto.dart';

import 'package:vakinha_burguer_flutter/app/models/product_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus stateStatus;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppingBag;

  const HomeState(this.errorMessage,
      {required this.stateStatus,
      required this.products,
      required this.shoppingBag});

  const HomeState.initial()
      : stateStatus = HomeStateStatus.initial,
        products = const [],
        shoppingBag = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [stateStatus, products, errorMessage, shoppingBag];

  HomeState copyWith({
    HomeStateStatus? stateStatus,
    List<ProductModel>? products,
    String? errorMessage,
    List<OrderProductDto>? shoppingBag,
  }) {
    return HomeState(
      stateStatus: stateStatus ?? this.stateStatus,
      products: products ?? this.products,
      shoppingBag: shoppingBag ?? this.shoppingBag,
      errorMessage ?? this.errorMessage,
    );
  }
}
