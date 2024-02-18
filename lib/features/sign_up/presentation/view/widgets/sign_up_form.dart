import 'package:ecommerce/core/helper/extentions.dart';
import 'package:ecommerce/core/routs/routing.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/widgets/custom_elevation_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_filed.dart';
import 'package:ecommerce/core/widgets/form_error.dart';
import 'package:ecommerce/features/sign_up/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignUpCubit.get(context).globalKey,
      child: Column(
        children: [
          buildEmailTextFormFiled(context),
          Gap(15.h),
          buildPasswordTextFormFiled(context),
          Gap(15.h),
          buildConfirmPasswordTextFormFiled(context),
          Gap(30.h),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return FormErrors(errors: SignUpCubit.get(context).errors);
            },
          ),
          Gap(5.h),
          CustomElevationButton(
            onPressed: () {
              if (SignUpCubit.get(context).globalKey.currentState!.validate()) {
                // goto profile page
                context.pushNamed(Routing.completeProfile);
              }
            },
            text: 'Continue',
          ),
        ],
      ),
    );
  }

  CustomTextFormFiled buildConfirmPasswordTextFormFiled(BuildContext context) {
    return CustomTextFormFiled(
      textEditingController: SignUpCubit.get(context).confirmPasswordController,
      onChanged: (value) {
        if (SignUpCubit.get(context).passwordController.text ==
            SignUpCubit.get(context).confirmPasswordController.text) {
          SignUpCubit.get(context).removeError(kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return '';
        } else if (SignUpCubit.get(context).passwordController.text !=
            SignUpCubit.get(context).confirmPasswordController.text) {
          SignUpCubit.get(context).addErrorToList(kMatchPassError);

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

  CustomTextFormFiled buildPasswordTextFormFiled(BuildContext context) {
    return CustomTextFormFiled(
      textEditingController: SignUpCubit.get(context).passwordController,
      onChanged: (value) {
        if (value.isNotEmpty &&
            !SignUpCubit.get(context).errors.contains(kPassNullError)) {
          SignUpCubit.get(context).removeError(kPassNullError);
        } else if (value.length >= 8 &&
            SignUpCubit.get(context).errors.contains(kShortPassError)) {
          SignUpCubit.get(context).removeError(kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty &&
            !SignUpCubit.get(context).errors.contains(kPassNullError)) {
          SignUpCubit.get(context).addErrorToList(kPassNullError);

          return '';
        } else if (value.length < 8 &&
            !SignUpCubit.get(context).errors.contains(kShortPassError)) {
          SignUpCubit.get(context).addErrorToList(kShortPassError);

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

  CustomTextFormFiled buildEmailTextFormFiled(BuildContext context) {
    return CustomTextFormFiled(
      textEditingController: SignUpCubit.get(context).emailController,
      onChanged: (value) {
        if (value.isNotEmpty &&
            SignUpCubit.get(context).errors.contains(kEmailNullError)) {
          SignUpCubit.get(context).removeError(kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            SignUpCubit.get(context).errors.contains(kInvalidEmailError)) {
          SignUpCubit.get(context).removeError(kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty &&
            !SignUpCubit.get(context).errors.contains(kEmailNullError)) {
          SignUpCubit.get(context).addErrorToList(kEmailNullError);

          return '';
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !SignUpCubit.get(context).errors.contains(kInvalidEmailError)) {
          SignUpCubit.get(context).addErrorToList(kInvalidEmailError);

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
