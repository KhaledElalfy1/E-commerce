import 'package:ecommerce/features/login/presentation/view/widgets/sign_in_container.dart';
import 'package:flutter/material.dart';

class SocialMediaSignUp extends StatelessWidget {
  const SocialMediaSignUp({
    super.key, required this.loginWithGoogle, required this.loginWithFaceBook, required this.loginWithTwitter,
  });
  final VoidCallback loginWithGoogle, loginWithFaceBook, loginWithTwitter;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignInContainer(
          iconPath: 'assets/icons/google-icon.svg',
          onTap: loginWithGoogle,
        ),
        SignInContainer(
          iconPath: 'assets/icons/facebook-2.svg',
          onTap:loginWithFaceBook,
        ),
        SignInContainer(
          iconPath: 'assets/icons/twitter.svg',
          onTap: loginWithTwitter,
        )
      ],
    );
  }
}
