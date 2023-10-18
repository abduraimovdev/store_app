part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductGetAllDataEvent extends ProductEvent {
  const ProductGetAllDataEvent({this.categories});

  final List<String>? categories;

  @override
  List<Object?> get props => [];
}
