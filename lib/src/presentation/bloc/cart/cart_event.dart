part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartInitialEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}

class CartAddProductEvent extends CartEvent {

  const CartAddProductEvent({required this.cartItem});
  final CartItem cartItem;

  @override
  List<Object?> get props => [cartItem];
}

class CartIncrementProductEvent extends CartEvent {

  const CartIncrementProductEvent({required this.productId});
  final String productId;

  @override
  List<Object?> get props => [productId];
}

class CartDecrementProductEvent extends CartEvent {

  const CartDecrementProductEvent({required this.productId});
  final String productId;

  @override
  List<Object?> get props => [productId];
}

class CartDeleteProductEvent extends CartEvent {

  const CartDeleteProductEvent({required this.productId});
  final String productId;

  @override
  List<Object?> get props => [productId];
}

class CartClearEvent extends CartEvent {
  const CartClearEvent();

  @override
  List<Object?> get props => [];
}
