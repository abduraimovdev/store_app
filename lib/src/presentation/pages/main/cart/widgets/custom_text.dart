import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.color,
    required this.fontsize,
    this.padding,
    required this.text,
    this.fontWeight,
    super.key,
  });

  final EdgeInsets? padding;
  final String text;
  final double fontsize;
  final Color color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? const EdgeInsets.only(left: 15, top: 15),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontsize,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
      );
}
