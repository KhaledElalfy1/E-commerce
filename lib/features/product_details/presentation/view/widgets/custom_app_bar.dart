import 'package:ecommerce/core/helper/extentions.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.w),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
            margin: EdgeInsets.only(right: 16.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(23.r),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Text(
                  '4.7',
                  style: AppFonts.semiBold24Black.copyWith(
                    fontSize: 20,
                  ),
                ),
                Gap(5.w),
                SvgPicture.asset('assets/icons/Star Icon.svg')
              ],
            )),
      ],
    );
  }
}
