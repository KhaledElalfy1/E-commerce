import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevationButton extends StatelessWidget {
  const CustomElevationButton({
    super.key, this.onPressed, required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
          Size(350.w, 65.h),
        ),
        backgroundColor: const MaterialStatePropertyAll(kPrimaryColor),
      ),
      child: Text(
        text,
        style: AppFonts.normal25White,
      ),
    );
  }
}
