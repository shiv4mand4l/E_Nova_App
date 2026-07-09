import 'package:e_nova/features/authentication/screens/onboarding/onboardingbloc/bloc/on_boarding_bloc.dart';
import 'package:e_nova/features/authentication/screens/onboarding/onboardingbloc/bloc/on_boarding_event.dart';
import 'package:e_nova/features/authentication/screens/onboarding/onboardingbloc/bloc/on_boarding_state.dart';
import 'package:e_nova/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_nova/features/authentication/screens/onboarding/widgets/onboarding_primary_and_skip_btn.dart';
import 'package:e_nova/features/authentication/screens/onboarding/widgets/onboarding_smooth_indicator.dart';
import 'package:e_nova/utlis/constants/app_images.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppOnboarding extends StatelessWidget {
  AppOnboarding({super.key});

  final PageController _pageController = PageController();

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
                  title: AppText.firstOnBoarding1Title,
                  subTitle: AppText.firstOnBoarding1Subtitle,
                  animation: AppImages.onBoadringAnimation1,
                ),
                OnBoardingPage(
                  title: AppText.secondOnBoarding1Title,
                  subTitle: AppText.secondOnBoarding1Subtitle,
                  animation: AppImages.onBoadringAnimation2,
                ),
                OnBoardingPage(
                  title: AppText.thirdOnBoarding1Title,
                  subTitle: AppText.thirdOnBoarding1Subtitle,
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
