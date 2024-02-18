import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/widgets/custom_text_form_filed.dart';
import 'package:ecommerce/features/login/presentation/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextFormFiled(
            textEditingController: LoginCubit.get(context).emailController,
            onChanged: (value) {
              if (value.isNotEmpty &&
                  LoginCubit.get(context).errors.contains(kEmailNullError)) {
                LoginCubit.get(context).removeError(kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  LoginCubit.get(context).errors.contains(kInvalidEmailError)) {
                LoginCubit.get(context).removeError(kInvalidEmailError);
                
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty &&
                  !LoginCubit.get(context).errors.contains(kEmailNullError)) {
                LoginCubit.get(context).addErrorToList(kEmailNullError);

                return '';
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !LoginCubit.get(context)
                      .errors
                      .contains(kInvalidEmailError)) {
                LoginCubit.get(context).addErrorToList(kInvalidEmailError);
                
                return '';
              }
              return null;
            },
            hintText: 'enter your Email',
            label: 'Email',
            iconPath: 'assets/icons/Mail.svg',
            keyboardType: TextInputType.emailAddress,
          ),
          Gap(30.h),
          CustomTextFormFiled(
            textEditingController: LoginCubit.get(context).passwordController,
            onChanged: (value) {
              if (value.isNotEmpty &&
                  !LoginCubit.get(context).errors.contains(kPassNullError)) {
                
                LoginCubit.get(context).removeError(kPassNullError);
                
              } else if (value.length >= 8 &&
                  LoginCubit.get(context).errors.contains(kShortPassError)) {
                LoginCubit.get(context).removeError(kShortPassError);
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty &&
                  !LoginCubit.get(context).errors.contains(kPassNullError)) {
                LoginCubit.get(context).addErrorToList(kPassNullError);

                return '';
              } else if (value.length < 8 &&
                  !LoginCubit.get(context).errors.contains(kShortPassError)) {
                LoginCubit.get(context).addErrorToList(kShortPassError);
                
                return '';
              }
              return null;
            },
            hintText: 'enter your Password',
            label: 'Password',
            iconPath: 'assets/icons/Lock.svg',
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
