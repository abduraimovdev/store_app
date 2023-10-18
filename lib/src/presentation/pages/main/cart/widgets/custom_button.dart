import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.imageUrl,
    required this.text,
    required this.width,
    super.key,
  });

  final String text;
  final String imageUrl;
  final double width;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          fixedSize: Size(width, 35),
          backgroundColor: Colors.white,
          side: const BorderSide(
            color: Color(0xFFDEDEDE),
            width: 2,
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage(imageUrl),
              height: 25,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF303336),
              ),
            ),
          ],
        ),
      );
}
