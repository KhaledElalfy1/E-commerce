import 'package:ecommerce/core/routs/app_router.dart';
import 'package:ecommerce/core/routs/routing.dart';
import 'package:ecommerce/core/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tokoto extends StatelessWidget {
  const Tokoto({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 783.2727272727273),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          initialRoute: Routing.init,
          onGenerateRoute: AppRouter().generateRoute,
        );
      },
    );
  }
}
