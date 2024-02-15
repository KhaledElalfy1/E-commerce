import 'package:ecommerce/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: kTextColor),
      bodyMedium: TextStyle(color: kTextColor),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          ),
      centerTitle: true,
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 40.w,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: outLineInputBorderTheme(color: Colors.grey),
      enabledBorder: outLineInputBorderTheme(color: Colors.grey),
      focusedBorder: outLineInputBorderTheme(color: Colors.green),
      errorBorder: outLineInputBorderTheme(color: Colors.red),
    ),
  );
}

OutlineInputBorder outLineInputBorderTheme({required Color color}) {
  return OutlineInputBorder(
    gapPadding: 10,
    borderSide: BorderSide(
      color: color,
    ),
    borderRadius: BorderRadius.circular(
      30.r,
    ),
  );
}
