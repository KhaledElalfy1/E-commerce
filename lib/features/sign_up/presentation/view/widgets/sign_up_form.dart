import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/widgets/custom_elevation_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_filed.dart';
import 'package:ecommerce/core/widgets/form_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          buildEmailTextFormFiled(),
          Gap(15.h),
          buildPasswordTextFormFiled(),
          Gap(15.h),
          buildConfirmPasswordTextFormFiled(),
          Gap(30.h),
          FormErrors(errors: errors),
          Gap(5.h),
          CustomElevationButton(
            onPressed: () {
              if (globalKey.currentState!.validate()) {
                // goto profile page
                print('object');
              }
            },
            text: 'Continue',
          ),
        ],
      ),
    );
  }

  CustomTextFormFiled buildConfirmPasswordTextFormFiled() {
    return CustomTextFormFiled(
      textEditingController: confirmPasswordController,
      onChanged: (value) {
        if (passwordController.text == confirmPasswordController.text) {
          // TODO state mangment
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return '';
        } else if (passwordController.text != confirmPasswordController.text) {
          setState(() {
            errors.add(kMatchPassError);
          });
          return '';
        }
        return null;
      },
      hintText: 'Re-enter your Password',
      label: 'Confirm Password',
      iconPath: 'assets/icons/Lock.svg',
      obscureText: true,
    );
  }

  CustomTextFormFiled buildPasswordTextFormFiled() {
    return CustomTextFormFiled(
      textEditingController: passwordController,
      onChanged: (value) {
        if (value.isNotEmpty && !errors.contains(kPassNullError)) {
          // TODO state mangment
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          // TODO state mangment
          setState(() {
            errors.add(kPassNullError);
          });
          return '';
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return '';
        }
        return null;
      },
      hintText: 'Enter your Password',
      label: 'Password',
      iconPath: 'assets/icons/Lock.svg',
      obscureText: true,
    );
  }

  CustomTextFormFiled buildEmailTextFormFiled() {
    return CustomTextFormFiled(
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
          return '';
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return '';
        }
        return null;
      },
      hintText: 'Enter your Email',
      label: 'Email',
      iconPath: 'assets/icons/Mail.svg',
      keyboardType: TextInputType.emailAddress,
    );
  }
}
