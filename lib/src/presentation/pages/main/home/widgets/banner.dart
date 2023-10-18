import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/src/data/models/product.dart';

import '../../../../bloc/products/product_bloc.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductSuccessData) {
            List<ProductModel> list = state.products;
            list = list.reversed.toList();
            return SizedBox(
              height: 150,
              child: PageView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        list[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ),
            );
          }
          return const SizedBox(
            height: 150,
            child: Center(child: CircularProgressIndicator()),
          );
        },
      );
}
