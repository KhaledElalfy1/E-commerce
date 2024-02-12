import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignInContainer extends StatelessWidget {
  const SignInContainer({super.key, required this.iconPath, this.onTap});
  final String iconPath;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 16.w),
        padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.h),
        height: 50.h,
        width: 50.w,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
