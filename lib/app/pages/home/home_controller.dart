import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:vakinha_burguer_flutter/app/pages/home/home_state.dart';
import 'package:vakinha_burguer_flutter/app/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;
  HomeController(
    this._productsRepository,
  ) : super(const HomeState.initial());

  Future<void> loadProduct() async {
    emit(state.copyWith(stateStatus: HomeStateStatus.loading));
    try {
      final products = await _productsRepository.findAllProducts();
      emit(state.copyWith(
          stateStatus: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log(
        'Erro ao buscar produtos',
        error: e,
        stackTrace: s,
      );
      emit(state.copyWith(
          stateStatus: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar produtos'));
    }
  }
}
