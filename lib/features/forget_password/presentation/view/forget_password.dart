import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:ecommerce/core/widgets/custom_elevation_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_filed.dart';
import 'package:ecommerce/core/widgets/dont_have_account.dart';
import 'package:ecommerce/core/widgets/form_error.dart';
import 'package:ecommerce/features/forget_password/presentation/controller/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
                key: ForgetPasswordCubit.get(context).globalKey,
                child: CustomTextFormFiled(
                  textEditingController:
                      ForgetPasswordCubit.get(context).emailController,
                  onChanged: (value) {
                    if (value.isNotEmpty &&
                        ForgetPasswordCubit.get(context)
                            .errors
                            .contains(kEmailNullError)) {
                      ForgetPasswordCubit.get(context)
                          .removeError(kEmailNullError);
                    } else if (emailValidatorRegExp.hasMatch(value) &&
                        ForgetPasswordCubit.get(context)
                            .errors
                            .contains(kInvalidEmailError)) {
                      ForgetPasswordCubit.get(context)
                          .removeError(kInvalidEmailError);
                    }
                    return null;
                  },
                  validator: (value) {
                    if (value!.isEmpty &&
                        !ForgetPasswordCubit.get(context)
                            .errors
                            .contains(kEmailNullError)) {
                      ForgetPasswordCubit.get(context)
                          .addErrorToList(kEmailNullError);
                      return '';
                    } else if (!emailValidatorRegExp.hasMatch(value) &&
                        !ForgetPasswordCubit.get(context)
                            .errors
                            .contains(kInvalidEmailError)) {
                      ForgetPasswordCubit.get(context)
                          .addErrorToList(kInvalidEmailError);
                      return '';
                    }
                    return null;
                  },
                  hintText: 'enter your Email',
                  label: 'Email',
                  iconPath: 'assets/icons/Mail.svg',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                builder: (context, state) {
                  return FormErrors(
                      errors: ForgetPasswordCubit.get(context).errors);
                },
              ),
              Gap(100.h),
              CustomElevationButton(
                  onPressed: () {
                    if (ForgetPasswordCubit.get(context)
                        .globalKey
                        .currentState!
                        .validate()) {
                      ForgetPasswordCubit.get(context)
                          .globalKey
                          .currentState!
                          .save();
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
