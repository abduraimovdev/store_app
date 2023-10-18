import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/src/core/extension/cart_ext.dart';
import 'package:store_app/src/data/models/cart_item_model.dart';

import '../../../../../data/models/product.dart';
import '../../../../bloc/cart/cart_bloc.dart';
import '../../../../bloc/products/product_bloc.dart';

class HomeViewProduct extends StatelessWidget {
  const HomeViewProduct({
    super.key,
    required this.onPressed,
    required this.add,
    required this.product,
  });

  final void Function() onPressed;
  final void Function() add;
  final ProductModel product;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.image,
                    height: 132,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF2F2D2C),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.price.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            final isHave = state.cart.items
                                .cartContain(product.id.toString());
                            if (isHave == null) {
                              return IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartAddProductEvent(
                                          cartItem: CartItem(
                                        id: product.id.toString(),
                                        product: product,
                                        productCount: 1,
                                        totalPrice: product.price,
                                      )));
                                },
                                icon: SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC67C4E),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return IconButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                      CartIncrementProductEvent(
                                          productId: product.id.toString()));
                                },
                                icon: SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC67C4E),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${state.cart.items[isHave].productCount}',
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
