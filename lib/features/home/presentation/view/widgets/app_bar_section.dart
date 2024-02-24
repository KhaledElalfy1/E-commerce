import 'package:ecommerce/features/home/presentation/view/widgets/app_bar_icons.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/app_bar_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({
    super.key,
    this.cardOnTap,
    this.notificationOnTap,
  });
  final Function()? cardOnTap, notificationOnTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppBarTextFiled(),
          AppBarIcons(
            onTap: cardOnTap,
            iconPath: 'assets/icons/Cart Icon.svg',
            notifications: 0,
          ),
          AppBarIcons(
            onTap: notificationOnTap,
            iconPath: 'assets/icons/Bell.svg',
            notifications: 3,
          ),
        ],
      ),
    );
  }
}
