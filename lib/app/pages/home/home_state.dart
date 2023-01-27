// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

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

  const HomeState(this.errorMessage,
      {required this.stateStatus, required this.products});

  const HomeState.initial()
      : stateStatus = HomeStateStatus.initial,
        products = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [stateStatus, products, errorMessage];

  HomeState copyWith({
    HomeStateStatus? stateStatus,
    List<ProductModel>? products,
    String? errorMessage,
  }) {
    return HomeState(
      stateStatus: stateStatus ?? this.stateStatus,
      products: products ?? this.products,
      errorMessage ?? this.errorMessage,
    );
  }
}
