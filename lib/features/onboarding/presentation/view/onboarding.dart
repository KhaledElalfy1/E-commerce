import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/fonts.dart';
import 'package:ecommerce/features/onboarding/data/model/onboarding_data.dart';
import 'package:ecommerce/features/onboarding/presentation/cubit/indicator/indicator_cubit.dart';
import 'package:ecommerce/features/onboarding/presentation/view/widgets/onboarding_content.dart';
import 'package:ecommerce/features/onboarding/presentation/view/widgets/onboarding_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    var fromCubit = BlocProvider.of<IndicatorCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: PageView.builder(
                  onPageChanged: (value) {
                    fromCubit.currentIndex = value;
                    fromCubit.changeIndicator();
                  },
                  itemCount: OnBoardingData.onBoardingData.length,
                  itemBuilder: (context, index) {
                    return OnBoardingContent(
                      subtitle: OnBoardingData.onBoardingData[index]
                          ['subtitle']!,
                      path: OnBoardingData.onBoardingData[index]['path']!,
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    BlocBuilder<IndicatorCubit, IndicatorState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            OnBoardingData.onBoardingData.length,
                            (index) {
                              return OnBoardingIndicator(
                                index: index,
                                currentPage: fromCubit.currentIndex,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Gap(65.h),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(
                            Size(350.w, 65.h),
                          ),
                          backgroundColor:
                              const MaterialStatePropertyAll(kPrimaryColor),
                        ),
                        child: Text(
                          'Continuo',
                          style: AppFonts.normal25White,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
