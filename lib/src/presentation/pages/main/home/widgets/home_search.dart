import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              color: Color(0xFF989898),
            ),
            hintText: 'Search coffee',
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 44,
                height: 44,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFFC67C4E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.settings_sharp),
                ),
              ),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            constraints: const BoxConstraints(
              minHeight: 52,
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      );
}
