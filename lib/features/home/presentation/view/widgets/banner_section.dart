import 'package:ecommerce/features/home/presentation/view/widgets/banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({
    super.key,
  });
  final List<Map<String, String>> banners = const [
    {
      'imagePath': 'assets/images/Image Banner 2.png',
      'title': 'Smart Phones',
      'subTitle': '18 brand',
    },
    {
      'imagePath': 'assets/images/Image Banner 3.png',
      'title': 'Fashion',
      'subTitle': '24 brand',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: banners.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: BannerWidget(
            imagePath: banners[index]['imagePath']!,
            title: banners[index]['title']!,
            subTitle: banners[index]['subTitle']!,
          ),
        ),
        separatorBuilder: (context, index) => Gap(10.w),
      ),
    );
  }
}
