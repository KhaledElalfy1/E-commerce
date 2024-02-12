
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:ecommerce/core/widgets/custom_elevation_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_filed.dart';
import 'package:ecommerce/core/widgets/dont_have_account.dart';
import 'package:ecommerce/core/widgets/form_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

final TextEditingController emailController = TextEditingController();
GlobalKey<FormState> globalKey = GlobalKey();
List<String> errors = [];

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            children: [
              Gap(MediaQuery.of(context).size.height * .05),
              Text(
                'Forgot Password',
                style: AppFonts.bold32Black,
                textAlign: TextAlign.center,
              ),
              Text(
                'Please enter your email and we will send  a link to return your account ',
                style: AppFonts.normal20Grey,
                textAlign: TextAlign.center,
              ),
              Gap(MediaQuery.of(context).size.height * .15),
              Form(
                key: globalKey,
                child: CustomTextFormFiled(
                  textEditingController: emailController,
                  onChanged: (value) {
                    if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                      // TODO state mangment
                      setState(() {
                        errors.remove(kEmailNullError);
                      });
                    } else if (emailValidatorRegExp.hasMatch(value) &&
                        errors.contains(kInvalidEmailError)) {
                      setState(() {
                        errors.remove(kInvalidEmailError);
                      });
                    }
                    return null;
                  },
                  validator: (value) {
                    if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                      // TODO state mangment
                      setState(() {
                        errors.add(kEmailNullError);
                      });
                    } else if (!emailValidatorRegExp.hasMatch(value) &&
                        !errors.contains(kInvalidEmailError)) {
                      setState(() {
                        errors.add(kInvalidEmailError);
                      });
                    }
                    return null;
                  },
                  hintText: 'enter your Email',
                  label: 'Email',
                  iconPath: 'assets/icons/Mail.svg',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              FormErrors(errors: errors),
              Gap(100.h),
              CustomElevationButton(
                  onPressed: () {
                    if (globalKey.currentState!.validate()) {
                      globalKey.currentState!.save();
                    }
                  },
                  text: "Continuo"),
              Gap(MediaQuery.of(context).size.height * .19),
              const DontHaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

