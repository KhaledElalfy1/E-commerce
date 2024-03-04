import 'package:ecommerce/core/helper/extentions.dart';
import 'package:ecommerce/core/model/product_model.dart';
import 'package:ecommerce/core/routs/routing.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routing.detailsScreen);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(.4),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Image.asset(
              productModel.imagePath,
              height: 130.h,
            ),
          ),
          const Text(
            'Wireless controller\nfor PS4',
          ),
          SizedBox(
            width: 150,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${productModel.price}',
                  style: AppFonts.normal16White.copyWith(color: kPrimaryColor),
                ),
               const Spacer(),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
