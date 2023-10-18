import 'package:flutter/material.dart';
import 'package:store_app/src/config/themes/themes.dart';
import 'package:store_app/src/core/utils/utils.dart';
import 'package:store_app/src/data/models/product.dart';

import 'widgets/detail_bottom_bar.dart';

part './mixin/detail_mixin.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with DetailMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: AppBar(
          title: const Text('Detail'),
          centerTitle: true,
          elevation: 0,
          foregroundColor: const Color(0xFFF9F9F9),
          backgroundColor: const Color(0xFFF9F9F9),
          shadowColor: Colors.white,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Icon(AppIcons.heart),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppUtils.sizeH16,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.productModel.image,
                    height: 226,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.productModel.title,
                                  style: const TextStyle(
                                    color: Color(0xFF2F2D2C),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                AppUtils.sizeH16,
                                const Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text('4.8 (230)'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF0F0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.abc_outlined,
                                    size: 24,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF0F0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.abc_outlined,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Color(0xFFEAEAEA)),
                    AppUtils.sizeH16,
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F2D2C),
                      ),
                    ),
                    AppUtils.sizeH16,
                    Text(
                      widget.productModel.description,
                      style: const TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    AppUtils.sizeH16,
                    const Text(
                      'Size',
                      style: TextStyle(
                        color: Color(0xFF2F2D2C),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppUtils.sizeH16,
                    const DetailSize()
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: DetailBottomBar(
          product: widget.productModel,
        ),
      );
}

class DetailSize extends StatefulWidget {
  const DetailSize({
    super.key,
  });

  @override
  State<DetailSize> createState() => _DetailSizeState();
}

class _DetailSizeState extends State<DetailSize> {
  List<String> size = [];
  List<String> sizes = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final item in sizes)
            GestureDetector(
              onTap: () {
                if (size.contains(item)) {
                  size.remove(item);
                } else {
                  size.add(item);
                }
                setState(() {});
              },
              child: SizedBox(
                width: 96,
                height: 43,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: size.contains(item)
                        ? const Color(0xFFC67C4E).withOpacity(0.3)
                        : Colors.white,
                    border: Border.all(
                      color: size.contains(item)
                          ? const Color(0xFFC67C4E)
                          : const Color(0xFFDEDEDE),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      );
}
