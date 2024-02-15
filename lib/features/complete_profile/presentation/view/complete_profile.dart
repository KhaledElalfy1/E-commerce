import 'package:ecommerce/core/utils/fonts.dart';
import 'package:ecommerce/features/complete_profile/presentation/view/widgets/complete_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
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
                'Complete Profile',
                style: AppFonts.bold32Black,
                textAlign: TextAlign.center,
              ),
              Text(
                'Complete your details \n or continuo with social media ',
                style: AppFonts.normal20Grey,
                textAlign: TextAlign.center,
              ),
              Gap(10.h),
              const CompleteProfileForm(),
              Gap(15.h),
              Text(
                  'By continuing you are confirm that you agree\n with our term and conditions',
                  textAlign: TextAlign.center,
                  style: AppFonts.normal20Black),
            ],
          ),
        ),
      ),
    );
  }
}
