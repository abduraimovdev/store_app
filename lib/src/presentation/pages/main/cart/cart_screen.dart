import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/src/presentation/pages/main/map/map_screen.dart';

import '../../../bloc/cart/cart_bloc.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_coffee.dart';
import 'widgets/custom_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isDeliver = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Order',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF2F2D2C),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 48,
              padding:
                  const EdgeInsets.only(top: 4, left: 5, right: 6, bottom: 4),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFEFEFEF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFC67C4E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Deliver',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pick Up',
                            style: TextStyle(
                              color: Color(0xFF2E2D2C),
                              fontSize: 16,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomText(
              color: Color(0xFF2F2D2C),
              fontsize: 21,
              text: 'Delivery Address',
              fontWeight: FontWeight.w600,
            ),
            const CustomText(
              color: Color(0xFF2F2D2C),
              fontsize: 15,
              text: 'Jl. Kpg Sutoyo',
            ),
            const CustomText(
              color: Color(0xFF808080),
              fontsize: 14,
              padding: EdgeInsets.only(left: 15, top: 15),
              text: 'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.s',
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                SizedBox(width: 15),
                CustomButton(
                  imageUrl: 'assets/icons/edit.png',
                  text: 'Edit Address',
                  width: 160,
                ),
                SizedBox(width: 15),
                CustomButton(
                  imageUrl: 'assets/icons/document.png',
                  text: 'Add Note',
                  width: 150,
                ),
              ],
            ),
            const Divider(
              color: Color(0xFFEAEAEA),
              endIndent: 15,
              indent: 15,
              thickness: 1.5,
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) => SizedBox(
                height: 100,
                child: ListView.separated(
                  itemBuilder: (context, index) => CustomCoffee(
                    cartItem: state.cart.items[index],
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    color: Color(0xFFEAEAEA),
                    endIndent: 15,
                    indent: 15,
                    thickness: 2,
                  ),
                  itemCount: state.cart.items.length,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.zero,
          height: 380,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    side: BorderSide(
                      color: Color(0xFF9B9B9B),
                    ),
                  ),
                  leading: const Image(
                    image: AssetImage(
                      'assets/icons/discount.png',
                    ),
                    height: 40,
                  ),
                  title: const Text(
                    '1 Discount is applied',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF2F2D2C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )),
                ),
              ),
              const CustomText(
                color: Color(0xFF2F2D2C),
                fontsize: 18,
                text: 'Payment Summary',
                fontWeight: FontWeight.w600,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    color: Color(0xFF2F2D2C),
                    fontsize: 18,
                    text: 'Price',
                  ),
                  CustomText(
                    color: Color(0xFF2F2D2C),
                    fontsize: 18,
                    padding: EdgeInsets.only(right: 15, top: 15),
                    text: '\$4.53',
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    color: Color(0xFF2F2D2C),
                    fontsize: 18,
                    text: 'Delivery Fee',
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Color(0xFF2F2D2C),
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: '\$2.0',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        TextSpan(
                          text: ' \$1.0    ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Color(0xFFEAEAEA),
                endIndent: 15,
                indent: 15,
                thickness: 2,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    color: Color(0xFF2F2D2C),
                    fontsize: 18,
                    text: 'Total Payment',
                  ),
                  CustomText(
                    color: Color(0xFF2F2D2C),
                    fontsize: 18,
                    padding: EdgeInsets.only(right: 15, top: 15),
                    text: '\$5.53',
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              const Divider(
                color: Color(0xFFEAEAEA),
                endIndent: 15,
                indent: 15,
                thickness: 2,
              ),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Image(
                    image: AssetImage(
                      'assets/icons/money.png',
                    ),
                    height: 30,
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 30,
                    width: 70,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Color(0xFFC67C4E),
                    ),
                    child: const Center(
                      child: CustomText(
                        color: Colors.white,
                        fontsize: 15,
                        text: 'Cash',
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const CustomText(
                    color: Color(0xFF2F2D2C),
                    fontsize: 15,
                    text: '\$ 5.53 ',
                    padding: EdgeInsets.zero,
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 13,
                    backgroundColor: Color(0xFF808080),
                    child: Center(
                      child: Icon(
                        Icons.more_horiz,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: FilledButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xFFC67C4E),
                  ),
                  onPressed: () {
                    context.read<CartBloc>().add(const CartClearEvent());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Maxsulot Buyurma berildi Maxsulot Yo'lda"),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MapScreen(),
                      ),
                    );
                  },
                  child: const CustomText(
                    color: Colors.white,
                    fontsize: 20,
                    text: 'Order',
                    padding: EdgeInsets.zero,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
