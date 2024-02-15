import 'package:ecommerce/core/helper/extentions.dart';
import 'package:ecommerce/core/routs/routing.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/widgets/custom_elevation_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_filed.dart';
import 'package:ecommerce/core/widgets/form_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController addressNameController = TextEditingController();
  List<String> errors = [];
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          buildFirstNameFormFiled(
              controller: firstNameController,
              error: kNamelNullError,
              hintText: 'Enter your First Name',
              label: 'First Name',
              iconPath: 'assets/icons/User Icon.svg'),
          Gap(15.h),
          buildFirstNameFormFiled(
              controller: lastNameController,
              error: kNamelNullError,
              hintText: 'Enter your Last Name',
              label: 'Last Name',
              iconPath: 'assets/icons/User Icon.svg'),
          Gap(15.h),
          buildFirstNameFormFiled(
            controller: phoneNameController,
            error: kPhoneNumberNullError,
            hintText: 'Enter your Phone Number',
            label: 'Phone Number',
            iconPath: 'assets/icons/Phone.svg',
            keyboardType: TextInputType.number,
          ),
          Gap(15.h),
          buildFirstNameFormFiled(
              controller: addressNameController,
              error: kAddressNullError,
              hintText: 'Enter your Address',
              label: 'Address',
              iconPath: 'assets/icons/Location point.svg'),
          Gap(25.h),
          FormErrors(errors: errors),
          Gap(10.h),
          CustomElevationButton(
            onPressed: () {
              if (globalKey.currentState!.validate()) {
                context.pushNamed(Routing.otp,argument: phoneNameController.text);
              }
            },
            text: 'Continue',
          ),
        ],
      ),
    );
  }

  CustomTextFormFiled buildFirstNameFormFiled(
      {required String error,
      required String hintText,
      required String label,
      required String iconPath,
      required TextEditingController controller,
      TextInputType keyboardType = TextInputType.text}) {
    return CustomTextFormFiled(
      textEditingController: controller,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(error)) {
          // TODO state mangment
          setState(() {
            errors.remove(error);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(error)) {
          // TODO state mangment
          setState(() {
            errors.add(error);
          });
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
