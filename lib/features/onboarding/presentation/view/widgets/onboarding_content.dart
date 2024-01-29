import 'package:ecommerce/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.subtitle,
    required this.path,
  });
  final String subtitle, path;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 1,
        ),
        Text(
          'TOKOTO',
          style: AppFonts.appTitleStyle,
        ),
        Text(
          subtitle,
          style: AppFonts.normal20Black,
          textAlign: TextAlign.center,
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          path,
          height: 300,
        ),
        const Spacer(
          flex: 4,
        )
      ],
    );
  }
}
