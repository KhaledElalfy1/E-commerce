import 'package:ecommerce/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({
    super.key,
    required this.index,
    required this.currentPage,
  });
  final int index, currentPage;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 6.w),
      width: index == currentPage ? 20.w : 6.w,
      height: 6.h,
      decoration: BoxDecoration(
          color: index == currentPage ? kPrimaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(3.r)),
    );
  }
}
