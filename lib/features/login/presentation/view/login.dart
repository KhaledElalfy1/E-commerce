import 'package:ecommerce/core/helper/extentions.dart';
import 'package:ecommerce/core/routs/routing.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:ecommerce/core/widgets/custom_elevation_button.dart';
import 'package:ecommerce/core/widgets/dont_have_account.dart';
import 'package:ecommerce/core/widgets/form_error.dart';
import 'package:ecommerce/core/widgets/sign_up_with_social.dart';
import 'package:ecommerce/features/login/presentation/controller/cubit/login_cubit.dart';
import 'package:ecommerce/features/login/presentation/view/widgets/form_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign in',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Gap(20.h),
              Text(
                'Welcome Back',
                style: AppFonts.bold32Black,
                textAlign: TextAlign.center,
              ),
              Text(
                'Sign in with Email and Password \n or continuo with social media ',
                style: AppFonts.normal20Grey,
                textAlign: TextAlign.center,
              ),
              Gap(60.h),
              const FormSection(),
              Gap(20.h),
              Row(
                children: [
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Checkbox(
                          value: LoginCubit.get(context).rememberMe,
                          activeColor: kPrimaryColor,
                          onChanged: (value) {
                            LoginCubit.get(context).remember();
                          });
                    },
                  ),
                  Text(
                    'Remember me',
                    style: AppFonts.normal16Grey,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(Routing.forgetPassword);
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: kPrimaryColor,
                      ),
                    ),
                  )
                ],
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return FormErrors(errors: LoginCubit.get(context).errors);
                },
              ),
              Gap(20.h),
              CustomElevationButton(
                onPressed: () {
                  if (LoginCubit.get(context)
                      .formKey
                      .currentState!
                      .validate()) {
                    LoginCubit.get(context).formKey.currentState!.save();
                    context.pushReplacementNamed(Routing.successfulLogin);
                  }
                },
                text: 'Continue',
              ),
              Gap(12.h),
              SocialMediaSignUp(
                  loginWithGoogle: () {},
                  loginWithFaceBook: () {},
                  loginWithTwitter: () {}),
              const DontHaveAccountWidget()
            ],
          ),
        ),
      ),
    );
  }
}
