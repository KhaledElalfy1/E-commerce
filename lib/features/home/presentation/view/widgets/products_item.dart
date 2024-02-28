import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.imagePath,
  });
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(.4),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Image.asset(
            imagePath,
            height: 130.h,
          ),
        ),
        const Text(
          'Wireless controller\nfor PS4',
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$6.56',
              style: AppFonts.normal16White.copyWith(color: kPrimaryColor),
            ),
            Gap(120.w),
            const Icon(
              Icons.favorite,
              color: Colors.red,
            )
          ],
        )
      ],
    );
  }
}
