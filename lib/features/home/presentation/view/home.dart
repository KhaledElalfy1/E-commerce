import 'package:ecommerce/features/home/presentation/view/category_section.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/app_bar_section.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/discount_banner.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/text_section.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            children: [
              AppBarSection(
                cardOnTap: () {},
                notificationOnTap: () {},
              ),
              Gap(16.h),
              const DiscountContainer(),
              Gap(16.h),
              const CategorySection(),
              Gap(16.h),
              TextSection(
                prefixText: 'Special For You',
                suffixText: 'See More',
                onPressed: () {},
              ),
              Gap(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
