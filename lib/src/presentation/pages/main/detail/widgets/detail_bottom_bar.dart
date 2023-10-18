import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/src/core/extension/cart_ext.dart';
import 'package:store_app/src/data/models/cart_item_model.dart';
import 'package:store_app/src/data/models/product.dart';

import '../../../../bloc/cart/cart_bloc.dart';

class DetailBottomBar extends StatelessWidget {
  const DetailBottomBar({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) => BottomAppBar(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        child: SizedBox(
          width: double.infinity,
          height: 110,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Color(0xFFF9F9F9),
              border: Border(
                top: BorderSide(
                  color: Color(0xFFF1F1F1),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '\$ ${product.price}',
                        style: const TextStyle(
                          color: Color(0xFFC67C4E),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      final isHave =
                          state.cart.items.cartContain(product.id.toString());
                      if (isHave != null) {
                        return TextButton(
                          onPressed: () {
                            context.read<CartBloc>().add(CartIncrementProductEvent(productId: product.id.toString()));
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 80,
                              vertical: 15,
                            ),
                            backgroundColor: const Color(0xFFC67C4E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            '${state.cart.items[isHave].productCount}+',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      } else {
                        return TextButton(
                          onPressed: () {
                            context.read<CartBloc>().add(
                                  CartAddProductEvent(
                                    cartItem: CartItem(
                                      id: product.id.toString(),
                                      product: product,
                                      productCount: 1,
                                      totalPrice: product.price,
                                    ),
                                  ),
                                );
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 80,
                              vertical: 15,
                            ),
                            backgroundColor: const Color(0xFFC67C4E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
