import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons(
      {super.key,
      required this.iconPath,
      required this.notifications,
      this.onTap});
  final String iconPath;
  final int notifications;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50.r),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kSecondaryColor.withOpacity(.1),
            ),
            child: SvgPicture.asset(
              iconPath,
              height: 20,
            ),
          ),
          notifications != 0
              ? Positioned(
                  right: -3,
                  child: Container(
                    alignment: Alignment.center,
                    width: 16.w,
                    height: 16.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text(
                      notifications.toString(),
                      textAlign: TextAlign.center,
                      style: AppFonts.normal22White.copyWith(fontSize: 12),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
