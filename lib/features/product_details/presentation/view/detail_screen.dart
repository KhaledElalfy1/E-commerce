import 'package:ecommerce/core/model/product_model.dart';
import 'package:ecommerce/features/product_details/presentation/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6F9),
      body: SafeArea(
        child: Column(
          children: [
            Gap(20.h),
            const CustomAppBar(),
            SizedBox(
              height: 200.h,
              child: Image.asset(
                productModel.imagePath,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              width: double.infinity,
              height: 300.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
