import 'package:ecommerce/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.prefixText,
    this.onPressed,
  });
  final String prefixText;
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
            'See More',
            style: AppFonts.normal16Grey,
          ),
        ),
      ],
    );
  }
}
