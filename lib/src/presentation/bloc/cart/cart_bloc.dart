import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/cart_item_model.dart';
import '../../../data/models/cart_model.dart';
import '../../../domain/repositories/cart/cart_repository.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc(this.cart)
      : repository = CartRepositoryImpl(),
        super(CartState(cart: cart, status: CartStatus.initial)) {
    on<CartEvent>((event, emit) => switch (event) {
          final CartAddProductEvent e => _addProduct(e, emit),
          final CartIncrementProductEvent e => _productIncrement(e, emit),
          final CartDecrementProductEvent e => _productDecrement(e, emit),
          final CartDeleteProductEvent e => _productDelete(e, emit),
          final CartClearEvent e => _clearCart(e, emit),
          _ => () {},
        });
  }
  CartRepository repository;
  CartModel cart;

  // Bloc Methods
  Future<void> _addProduct(CartAddProductEvent event, Emitter emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    bool have = false;
    for (final item in cart.items) {
      if (item.id == event.cartItem.id) {
        have = true;
      }
    }
    if (have) {
      _productInc(event.cartItem.id);
    } else {
      cart.items = [...cart.items, event.cartItem];
    }
    await repository.saveCard(cart);
    emit(state.copyWith(status: CartStatus.addCartItemSuccess, cart: cart));
  }

  Future<void> _productIncrement(CartIncrementProductEvent event, Emitter emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = _productInc(event.productId);
    if (result == null) {
      emit(state.copyWith(status: CartStatus.increment, cart: cart));
    } else {}
    await repository.saveCard(cart);
  }

  Future<void> _productDecrement(CartDecrementProductEvent event, Emitter emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = _productDec(event.productId);
    if (result == null) {
      emit(state.copyWith(status: CartStatus.decrement, cart: cart));
    } else if (result == '-') {
      _deleteProduct(event.productId);
    } else {}
    await repository.saveCard(cart);
  }

  Future<void> _productDelete(CartDeleteProductEvent event, Emitter emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = _deleteProduct(event.productId);
    if (result == null) {
      emit(state.copyWith(status: CartStatus.deletedSuccess, cart: cart));
    } else {}
    await repository.saveCard(cart);
  }

  Future<void> _clearCart(CartClearEvent event, Emitter emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    cart.items = [];
    emit(state.copyWith(status: CartStatus.clearCart, cart: cart));
    await repository.saveCard(cart);
  }

  // Auxiliary Methods
  String? _productInc(String productId) {
    const String result = 'Not Found Cart Item';
    for (int i = 0; i < cart.items.length; i++) {
      if (cart.items[i].id == productId) {
        cart.items[i].productCount = cart.items[i].productCount + 1;
        cart.items[i].totalPrice = cart.items[i].totalPrice +
            (cart.items[i].product.price ?? 0);
        return null;
      }
    }
    return result;
  }

  String? _productDec(String productId) {
    String? result = 'Not Found Cart Item';
    for (int i = 0; i < cart.items.length; i++) {
      if (cart.items[i].id == productId) {
        if (cart.items[i].productCount > 1) {
          cart.items[i].productCount = cart.items[i].productCount - 1;
          cart.items[i].totalPrice = cart.items[i].totalPrice -
              (cart.items[i].product.price ?? 0);
          result = null;
        } else {
          return '-';
        }
      }
    }
    return result;
  }

  String? _deleteProduct(String productId) {
    String? result = 'Not Found Cart Item';

    for (int i = 0; i < cart.items.length; i++) {
      if (cart.items[i].id == productId) {
        cart.items.removeAt(i);
        result = null;
      }
    }
    return result;
  }
}
