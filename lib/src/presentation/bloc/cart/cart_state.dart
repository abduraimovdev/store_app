part of 'cart_bloc.dart';

enum CartStatus {
  initial,
  loading,
  addCartItemSuccess,
  addCartItemError,
  increment,
  decrement,
  deletedSuccess,
  clearCart,
}

class CartState extends Equatable {

  const CartState({required this.cart, required this.status});
  final CartModel cart;
  final CartStatus status;

  @override
  List<Object?> get props => [cart, status];


  CartItem? isProduct(String productId) {
    CartItem? cartItem;
    for(final item in cart.items) {
      if(item.id == productId) {
        cartItem = item;
        return cartItem;
      }
    }
    return cartItem;
  }

  CartState copyWith({
    CartModel? cart,
    CartStatus? status,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      status: status ?? this.status,
    );
  }
}
