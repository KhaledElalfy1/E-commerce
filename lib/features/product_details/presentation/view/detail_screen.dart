import 'package:ecommerce/core/model/product_model.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:ecommerce/features/product_details/presentation/view/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/product_details/presentation/view/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
           const ProductDetails(),
          ],
        ),
      ),
    );
  }
}

