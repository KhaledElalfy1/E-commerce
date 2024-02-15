import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:ecommerce/core/widgets/custom_elevation_button.dart';
import 'package:ecommerce/features/otp/presentation/view/widgets/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OTP extends StatelessWidget {
  const OTP({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                'OTP Verification',
                style: AppFonts.bold32Black,
                textAlign: TextAlign.center,
              ),
              Text(
                'We send your code to +${_getPhone(phoneNumber)} ',
                style: AppFonts.normal20Grey,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'This code will Expired in ',
                    style: AppFonts.normal20Grey,
                    textAlign: TextAlign.center,
                  ),
                  TweenAnimationBuilder(
                    tween: IntTween(begin: 30, end: 0),
                    duration: const Duration(seconds: 30),
                    builder: (context, value, child) {
                      return Text(
                        ' 00:$value',
                        style: value > 0
                            ? AppFonts.normal20Grey
                                .copyWith(color: kPrimaryColor)
                            : AppFonts.normal20Grey,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ],
              ),
              Gap(MediaQuery.of(context).size.height * .15),
              const OtpForm(),
              Gap(MediaQuery.of(context).size.height * .15),
              CustomElevationButton(onPressed: () {}, text: 'Continue'),
              Gap(MediaQuery.of(context).size.height * .2),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend OTP Code',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  String _getPhone(String phoneNumber) {
    if (phoneNumber.length <= 3) return phoneNumber;
    return '${phoneNumber.substring(0, phoneNumber.length - 3)}***';
  }
}
