import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/src/config/router/app_routes.dart';

import '../../../bloc/products/product_bloc.dart';
import 'widgets/banner.dart';
import 'widgets/home_category.dart';
import 'widgets/home_search.dart';
import 'widgets/home_view_category.dart';
import 'widgets/top_bar.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 1,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.35,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.572,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ],
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TopBar(),
                        const SizedBox(
                          height: 20,
                        ),
                        const AppSearchBar(),
                        const SizedBox(
                          height: 20,
                        ),
                        const AppBanner(),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<ProductBloc, ProductState>(
                          buildWhen: (previous, current) =>
                              previous.categories != current.categories,
                          builder: (context, state) =>
                              state is ProductSuccessData
                                  ? HomeViewCategory(
                                      categories: state.categories,
                                      onChange: (categories) {
                                        bloc.add(
                                          ProductGetAllDataEvent(
                                            categories: categories,
                                          ),
                                        );
                                      },
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: BlocBuilder<ProductBloc, ProductState>(
                              buildWhen: (previous, current) =>
                                  current is ProductSuccessData,
                              builder: (context, state) =>
                                  state is ProductSuccessData
                                      ? GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 200 / 300,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5,
                                          ),
                                          itemCount: state.products.length,
                                          itemBuilder: (context, index) =>
                                              HomeViewProduct(
                                            product: state.products[index],
                                            add: () {},
                                            onPressed: () {
                                              context.pushNamed(Routes.detail,
                                                  extra: state.products[index]);
                                            },
                                          ),
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
