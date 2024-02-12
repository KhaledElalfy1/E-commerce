import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class FormErrors extends StatelessWidget {
  const FormErrors({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
          errors.length,
          (index) => FormErrorText(errors: errors[index]),
        ),
        );
  }
}

class FormErrorText extends StatelessWidget {
  const FormErrorText({
    super.key,
    required this.errors,
  });

  final String errors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          width: 14.w,
          height: 14.h,
        ),
        Gap(10.w),
        Text(errors),
      ],
    );
  }
}
