part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState({required this.categories});

  final List<String> categories;
}

class ProductInitial extends ProductState {
  const ProductInitial({required super.categories});

  @override
  List<Object> get props => [categories];
}

class ProductLoading extends ProductState {
  const ProductLoading({required super.categories});

  @override
  List<Object> get props => [categories];
}

class ProductSuccessData extends ProductState {
  const ProductSuccessData({required super.categories, required this.products});

  final List<ProductModel> products;

  @override
  List<Object> get props => [products, categories];
}

class ProductError extends ProductState {
  const ProductError({required super.categories});

  @override
  List<Object> get props => [categories];
}
