import 'package:ecommerce/core/routs/routing.dart';
import 'package:ecommerce/features/complete_profile/presentation/controller/cubit/complete_profile_cubit.dart';
import 'package:ecommerce/features/complete_profile/presentation/view/complete_profile.dart';
import 'package:ecommerce/features/forget_password/presentation/view/forget_password.dart';
import 'package:ecommerce/features/login/presentation/controller/cubit/login_cubit.dart';
import 'package:ecommerce/features/login/presentation/view/login.dart';
import 'package:ecommerce/features/no_routing/no_route.dart';
import 'package:ecommerce/features/onboarding/presentation/cubit/indicator/indicator_cubit.dart';
import 'package:ecommerce/features/onboarding/presentation/view/onboarding.dart';
import 'package:ecommerce/features/otp/presentation/view/otp.dart';
import 'package:ecommerce/features/sign_up/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommerce/features/sign_up/presentation/view/sign_up.dart';
import 'package:ecommerce/features/successful_login/presentation/view/successful_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => IndicatorCubit(),
            child: const OnBoarding(),
          ),
        );

      case Routing.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPassword(),
        );
      case Routing.completeProfile:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => CompleteProfileCubit(),
            child:const CompleteProfile(),
          ),
        );
      case Routing.otp:
        return MaterialPageRoute(
          builder: (_) => OTP(phoneNumber: argument as String),
        );

      case Routing.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const Login(),
          ),
        );

      case Routing.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignUpCubit(),
            child: const SignUp(),
          ),
        );
      case Routing.successfulLogin:
        return MaterialPageRoute(
          builder: (_) => const SuccessfulLogin(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const NoRoute(),
        );
    }
  }
}
