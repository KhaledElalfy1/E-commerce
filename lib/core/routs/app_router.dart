import 'package:ecommerce/core/routs/routing.dart';
import 'package:ecommerce/features/forget_password/presentation/view/forget_password.dart';
import 'package:ecommerce/features/login/presentation/view/login.dart';
import 'package:ecommerce/features/no_routing/no_route.dart';
import 'package:ecommerce/features/onboarding/presentation/cubit/indicator/indicator_cubit.dart';
import 'package:ecommerce/features/onboarding/presentation/view/onboarding.dart';
import 'package:ecommerce/features/sign_up/presentation/view/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => IndicatorCubit(),
            child:const OnBoarding(),
          ),
        );

      case Routing.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPassword(),
        );

      case Routing.login:
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );

      case Routing.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const NoRoute(),
        );
    }
  }
}
