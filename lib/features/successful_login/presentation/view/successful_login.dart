import 'package:ecommerce/core/utils/fonts.dart';
import 'package:ecommerce/core/widgets/custom_elevation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SuccessfulLogin extends StatelessWidget {
  const SuccessfulLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login Success'),
      ),
      body: Column(
        children: [
          Gap(MediaQuery.of(context).size.height * .09),
          Image.asset('assets/images/success.png'),
          Gap(MediaQuery.of(context).size.height * .09),
          Text(
            'Login Success',
            style: AppFonts.bold32Black,
          ),
          Gap(MediaQuery.of(context).size.height * .1),
          SizedBox(
            width: 240.w,
            child:
                CustomElevationButton(onPressed: () {}, text: 'Back To Home'),
          ),
        ],
      ),
    );
  }
}
