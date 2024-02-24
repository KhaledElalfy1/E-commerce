import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.iconPath, required this.text});
  final String iconPath, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: 55.h, maxWidth: 55.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: const Color(0xffFFECDF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(iconPath),
        ),
        Gap(5.h),
        Text(
          text,
        ),
      ],
    );
  }
}
