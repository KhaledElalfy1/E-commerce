import 'package:ecommerce/core/helper/produsts_data.dart';
import 'package:ecommerce/features/home/presentation/view/widgets/products_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: ProductsData.products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            productModel: ProductsData.products[index],
          );
        },
        separatorBuilder: (context, index) => Gap(10.w),
      ),
    );
  }
}
