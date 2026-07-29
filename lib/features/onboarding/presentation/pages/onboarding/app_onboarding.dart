import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_event.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_state.dart';
import 'package:e_nova/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:e_nova/features/onboarding/presentation/pages/widgets/onboarding_primary_and_skip_btn.dart';
import 'package:e_nova/features/onboarding/presentation/pages/widgets/onboarding_smooth_indicator.dart';
import 'package:e_nova/core/constants/app_images.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppOnboarding extends StatefulWidget {
  const AppOnboarding({super.key});

  @override
  State<AppOnboarding> createState() => _AppOnboardingState();
}

class _AppOnboardingState extends State<AppOnboarding> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<OnBoardingBloc>().add(CheckAppStatus());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Scrollable page
          BlocListener<OnBoardingBloc, OnBoardingState>(
            listener: (BuildContext context, state) {
              if (state.skip!) {
                _pageController.animateToPage(
                  2,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );

                context.read<OnBoardingBloc>().add(ResetSkipBtnEvent());
              }
            },
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                context.read<OnBoardingBloc>().add(PageChangedEvent(index));
              },
              children: [
                OnBoardingPage(
                  title: AppStrings.firstOnBoarding1Title,
                  subTitle: AppStrings.firstOnBoarding1Subtitle,
                  animation: AppImages.onBoadringAnimation1,
                ),
                OnBoardingPage(
                  title: AppStrings.secondOnBoarding1Title,
                  subTitle: AppStrings.secondOnBoarding1Subtitle,
                  animation: AppImages.onBoadringAnimation2,
                ),
                OnBoardingPage(
                  title: AppStrings.thirdOnBoarding1Title,
                  subTitle: AppStrings.thirdOnBoarding1Subtitle,
                  animation: AppImages.onBoadringAnimation3,
                ),
              ],
            ),
          ),

          // Smooth Page Indicator
          SmoothDotIndicator(pageController: _pageController),

          // Skip TextButton and Elevated Button
          OnBoardingPrimaryAndSkipBtn(pageController: _pageController),
        ],
      ),
    );
  }
}
