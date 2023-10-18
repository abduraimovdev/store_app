import 'package:flutter/material.dart';

class HomeViewCategory extends StatefulWidget {
  const HomeViewCategory({
    super.key,
    required this.categories,
    required this.onChange,
  });

  final List<String> categories;
  final void Function(List<String> categories) onChange;

  @override
  State<HomeViewCategory> createState() => _HomeViewCategoryState();
}

class _HomeViewCategoryState extends State<HomeViewCategory> {
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    selectedCategories.contains(widget.categories[index])
                        ? const Color(0xFFC67C4E)
                        : const Color(0xFFF3F3F3),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (selectedCategories.contains(widget.categories[index])) {
                  selectedCategories.remove(widget.categories[index]);
                } else {
                  selectedCategories.add(widget.categories[index]);
                }
                setState(() {});
                widget.onChange.call(selectedCategories);
              },
              child: Text(
                widget.categories[index],
                style: TextStyle(
                  color: selectedCategories.contains(widget.categories[index])
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF2F4B4E),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemCount: widget.categories.length,
          ),
        ),
      );
}
