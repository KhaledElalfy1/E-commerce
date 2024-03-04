import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(vertical: 16.w),
      width: double.infinity,
      // height: 300.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Wireless controller for PS4',
              style: AppFonts.semiBold24Black,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: const Color(0xffFFE6E6),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  topLeft: Radius.circular(16.r),
                ),
              ),
              child: SvgPicture.asset(
                'assets/icons/Heart Icon_2.svg',
                height: 20.h,
                color: Colors.red,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text(
              'Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing ...',
              style: AppFonts.normal20Black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'See More Details >',
              style: AppFonts.bold24White
                  .copyWith(color: kPrimaryColor, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
