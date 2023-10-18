import 'package:flutter/material.dart';

class CustomCoffeeCount extends StatelessWidget {
  const CustomCoffeeCount({
    required this.icon,
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  final IconData icon;

  @override
  Widget build(BuildContext context) => TextButton(
        style: TextButton.styleFrom(
          fixedSize: const Size(7, 7),
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          shape: const CircleBorder(
            side: BorderSide(
              color: Color(0xFF9B9B9B),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Icon(
          icon,
          color: const Color(0xFF9B9B9B),
        ),
      );
}
