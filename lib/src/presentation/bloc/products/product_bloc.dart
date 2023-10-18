import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product.dart';
import '../../../domain/repositories/product/product_repository.dart';
import '../../../domain/repositories/product/product_repository_impl.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc()
      : repository = ProductRepositoryImpl(),
        super(const ProductInitial(categories: [])) {
    on<ProductGetAllDataEvent>(_getData);
  }

  final ProductRepository repository;

  Future<void> _getData(ProductGetAllDataEvent event, Emitter emit) async {
    emit(ProductLoading(categories: state.categories));
    print('------------_${event.categories}');
    final products = await repository.getData(category: event.categories);
    final categories = await repository.getCategories();
    products.fold(
      (left) {
        emit(ProductError(categories: state.categories));
      },
      (right) {
        emit(ProductSuccessData(products: right, categories: categories));
      },
    );
  }
}
