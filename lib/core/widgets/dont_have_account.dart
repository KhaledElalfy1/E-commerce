import 'package:ecommerce/core/helper/extentions.dart';
import 'package:ecommerce/core/routs/routing.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: AppFonts.normal16Grey,
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(Routing.signUp);
          },
          child: Text(
            'Sign Up',
            style:
                AppFonts.normal16Grey.copyWith(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
