import 'package:equatable/equatable.dart';
import 'package:match/match.dart';
import 'package:vakinha_burguer_flutter/app/models/product_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
}

class HomeState extends Equatable {
  final HomeStateStatus stateStatus;
  final List<ProductModel> products;

  const HomeState.initial()
      : stateStatus = HomeStateStatus.initial,
        products = const [];

  const HomeState({required this.stateStatus, required this.products});
  @override
  List<Object?> get props => [stateStatus, products];

  HomeState copyWith({
    HomeStateStatus? stateStatus,
    List<ProductModel>? products,
  }) {
    return HomeState(
        stateStatus: stateStatus ?? this.stateStatus,
        products: products ?? this.products);
  }
}
