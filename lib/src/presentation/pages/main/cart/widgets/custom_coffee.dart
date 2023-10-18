import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/cart_item_model.dart';
import '../../../../bloc/cart/cart_bloc.dart';
import 'custom_coffee_count.dart';

class CustomCoffee extends StatelessWidget {
  const CustomCoffee({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Image(
          image: NetworkImage(
            cartItem.product.image,
          ),
        ),
        title: Text(
          cartItem.product.title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF2F2D2C),
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          cartItem.product.description,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF9B9B9B),
          ),
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomCoffeeCount(
              icon: Icons.remove,
              onPressed: () {
                context
                    .read<CartBloc>()
                    .add(CartDecrementProductEvent(productId: cartItem.id));
              },
            ),
            Text(
              '${cartItem.productCount}',
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF2F2D2C),
                fontWeight: FontWeight.w700,
              ),
            ),
            CustomCoffeeCount(
              icon: Icons.add,
              onPressed: () {
                context
                    .read<CartBloc>()
                    .add(CartIncrementProductEvent(productId: cartItem.id));
              },
            ),
          ],
        ),
      );
}
