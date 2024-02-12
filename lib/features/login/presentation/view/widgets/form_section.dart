import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FormSection extends StatefulWidget {
  const FormSection(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.formKey, required this.errors});
  final TextEditingController emailController, passwordController;
  final GlobalKey<FormState> formKey;
  final List<String> errors;

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextFormFiled(
            textEditingController: widget.emailController,
            onChanged: (value) {
              if (value.isNotEmpty && widget.errors.contains(kEmailNullError)) {
                // TODO state mangment
                setState(() {
                  widget.errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  widget.errors.contains(kInvalidEmailError)) {
                setState(() {
                  widget.errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !widget.errors.contains(kEmailNullError)) {
                // TODO state mangment
                setState(() {
                  widget.errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !widget.errors.contains(kInvalidEmailError)) {
                setState(() {
                  widget.errors.add(kInvalidEmailError);
                });
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
            textEditingController: widget.passwordController,
            onChanged: (value) {
              if (value.isNotEmpty && !widget.errors.contains(kPassNullError)) {
                // TODO state mangment
                setState(() {
                  widget.errors.remove(kPassNullError);
                });
              } else if (value.length >= 8 &&
                  widget.errors.contains(kShortPassError)) {
                setState(() {
                  widget.errors.remove(kShortPassError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !widget.errors.contains(kPassNullError)) {
                // TODO state mangment
                setState(() {
                  widget.errors.add(kPassNullError);
                });
              } else if (value.length < 8 &&
                  !widget.errors.contains(kShortPassError)) {
                setState(() {
                  widget.errors.add(kShortPassError);
                });
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
