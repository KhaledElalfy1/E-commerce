import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextFormFiled extends StatelessWidget {
  const OtpTextFormFiled({super.key,  this.isAutoFocus=false, this.onChanged, this.focusNode});
  final bool isAutoFocus;
  final Function(String)? onChanged;
 final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: TextFormField(
        focusNode:focusNode ,
        autofocus: isAutoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        obscureText: true,
        onChanged:onChanged ,
        style: const TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 16.w,
          ),
          enabledBorder: borderDecoration(),
          focusedBorder: borderDecoration(),
        ),
      ),
    );
  }

  OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        16.r,
      ),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 1.5,
      ),
    );
  }
}
