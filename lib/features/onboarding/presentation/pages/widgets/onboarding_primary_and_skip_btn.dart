import 'package:e_nova/core/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/core/common/widgets/buttons/app_text_button.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_event.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_state.dart';
import 'package:e_nova/core/routes/app_routes.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnBoardingPrimaryAndSkipBtn extends StatelessWidget {
  const OnBoardingPrimaryAndSkipBtn({super.key, required this._pageController});
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppSizes.spaceBtwItems * 5,
      left: AppSizes.w(context, 0.03),
      right: AppSizes.w(context, 0.06),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          AppTextButton(
            onTap: () {
              context.read<OnBoardingBloc>().add(SkipBtnEvent());
            },
            txtBtnName: 'SKIP',
          ),
          BlocBuilder<OnBoardingBloc, OnBoardingState>(
            builder: (context, state) {
              return AppElevatedButton(
                onTap: () {
                  if (state.isLastPage == true) {
                    context.go(AppRoutes.appLoginScreen);
                  } else {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                btnName: state.btnName ?? 'Next',
              );
            },
          ),
        ],
      ),
    );
  }
}
