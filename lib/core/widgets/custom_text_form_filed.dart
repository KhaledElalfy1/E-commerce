import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.keyboardType,
    required this.hintText,
    required this.label,
    required this.iconPath,
    this.obscureText,
    this.validator,
    this.onChanged, required this.textEditingController,
  });
  final TextInputType? keyboardType;
  final String hintText, label, iconPath;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 20.h, 20.w, 20.h),
          child: SvgPicture.asset(
            iconPath,
            height: 20.h,
          ),
        ),
        hintText: hintText,
        label: Text(label),
      ),
    );
  }
}
