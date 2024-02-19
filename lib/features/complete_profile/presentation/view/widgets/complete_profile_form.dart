import 'package:ecommerce/core/helper/extentions.dart';
import 'package:ecommerce/core/routs/routing.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/widgets/custom_elevation_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_filed.dart';
import 'package:ecommerce/core/widgets/form_error.dart';
import 'package:ecommerce/features/complete_profile/presentation/controller/cubit/complete_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CompleteProfileForm extends StatelessWidget {
  const CompleteProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: CompleteProfileCubit.get(context).globalKey,
      child: Column(
        children: [
          buildFirstNameFormFiled(
            context: context,
              controller: CompleteProfileCubit.get(context).firstNameController,
              error: kNamelNullError,
              hintText: 'Enter your First Name',
              label: 'First Name',
              iconPath: 'assets/icons/User Icon.svg'),
          Gap(15.h),
          buildFirstNameFormFiled(
            context: context,
              controller: CompleteProfileCubit.get(context).lastNameController,
              error: kNamelNullError,
              hintText: 'Enter your Last Name',
              label: 'Last Name',
              iconPath: 'assets/icons/User Icon.svg'),
          Gap(15.h),
          buildFirstNameFormFiled(
            context: context,
            controller: CompleteProfileCubit.get(context).phoneNameController,
            error: kPhoneNumberNullError,
            hintText: 'Enter your Phone Number',
            label: 'Phone Number',
            iconPath: 'assets/icons/Phone.svg',
            keyboardType: TextInputType.number,
          ),
          Gap(15.h),
          buildFirstNameFormFiled(
            context: context,
              controller:
                  CompleteProfileCubit.get(context).addressNameController,
              error: kAddressNullError,
              hintText: 'Enter your Address',
              label: 'Address',
              iconPath: 'assets/icons/Location point.svg'),
          Gap(25.h),
          BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
            builder: (context, state) {
              return FormErrors(
                  errors: CompleteProfileCubit.get(context).errors);
            },
          ),
          Gap(10.h),
          CustomElevationButton(
            onPressed: () {
              if (CompleteProfileCubit.get(context)
                  .globalKey
                  .currentState!
                  .validate()) {
                context.pushNamed(Routing.otp,
                    argument: CompleteProfileCubit.get(context)
                        .phoneNameController
                        .text);
              }
            },
            text: 'Continue',
          ),
        ],
      ),
    );
    
  }

  CustomTextFormFiled buildFirstNameFormFiled(
      {required BuildContext context,
        required String error,
      required String hintText,
      required String label,
      required String iconPath,
      required TextEditingController controller,
      TextInputType keyboardType = TextInputType.text}) {
    return CustomTextFormFiled(
      textEditingController: controller,
      onChanged: (value) {
        if (value.isNotEmpty &&
            CompleteProfileCubit.get(context).errors.contains(error)) {
          CompleteProfileCubit.get(context).removeError(error);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty &&
            !CompleteProfileCubit.get(context).errors.contains(error)) {
          CompleteProfileCubit.get(context).addErrorToList(error);

          return '';
        }
        return null;
      },
      hintText: hintText,
      label: label,
      iconPath: iconPath,
      keyboardType: keyboardType,
    );
  }
}
