import 'package:ecommerce/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection(
      {super.key,
      required this.prefixText,
      required this.suffixText,
      this.onPressed});
  final String prefixText, suffixText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          prefixText,
          style: AppFonts.semiBold24Black,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            suffixText,
            style: AppFonts.normal16Grey,
          ),
        ),
      ],
    );
  }
}
