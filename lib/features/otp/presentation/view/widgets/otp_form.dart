import 'package:ecommerce/features/otp/presentation/view/widgets/otp_text_form_filed.dart';
import 'package:flutter/material.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  @override
  void dispose() {
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OtpTextFormFiled(
            isAutoFocus: true,
            onChanged: (value) {
              nextFiled(value: value, focusNode: focusNode2);
            },
          ),
          OtpTextFormFiled(
            focusNode: focusNode2,
            onChanged: (value) {
              nextFiled(value: value, focusNode: focusNode3);
            },
          ),
          OtpTextFormFiled(
            focusNode: focusNode3,
            onChanged: (value) {
              nextFiled(value: value, focusNode: focusNode4);
            },
          ),
          OtpTextFormFiled(
            focusNode: focusNode4,
            onChanged: (value) {
              focusNode4.unfocus();
            },
          ),
        ],
      ),
    );
  }

  void nextFiled({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }
}
