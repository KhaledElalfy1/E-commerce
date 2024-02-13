import 'package:ecommerce/core/helper/extentions.dart';
import 'package:ecommerce/core/routs/routing.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:ecommerce/core/widgets/custom_elevation_button.dart';
import 'package:ecommerce/core/widgets/dont_have_account.dart';
import 'package:ecommerce/core/widgets/form_error.dart';
import 'package:ecommerce/features/login/presentation/view/widgets/form_section.dart';
import 'package:ecommerce/features/login/presentation/view/widgets/sign_in_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  List<String> errors = [];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
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
              FormSection(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: formKey,
                  errors: errors),
              Gap(20.h),
              Row(
                children: [
                  Checkbox(
                      value: rememberMe,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      }),
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
              FormErrors(errors: errors),
              Gap(20.h),
              CustomElevationButton(
                onPressed: () {
                  setState(() {});
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.pushReplacementNamed(Routing.successfulLogin);
                  }
                },
                text: 'Continue',
              ),
              Gap(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInContainer(
                    iconPath: 'assets/icons/google-icon.svg',
                    onTap: () {},
                  ),
                  SignInContainer(
                    iconPath: 'assets/icons/facebook-2.svg',
                    onTap: () {},
                  ),
                  SignInContainer(
                    iconPath: 'assets/icons/twitter.svg',
                    onTap: () {},
                  )
                ],
              ),
              const DontHaveAccountWidget()
            ],
          ),
        ),
      ),
    );
  }
}
