import 'package:ecommerce/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarTextFiled extends StatelessWidget {
  const AppBarTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 16.h,
            // horizontal: 24.w,
          ),
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search a Product',
          enabledBorder: borderDecoration(),
          focusedBorder: borderDecoration(),
        ),
      ),
    );
  }

  OutlineInputBorder borderDecoration() =>
      const OutlineInputBorder(borderSide: BorderSide.none);
}
