import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/helpers/app_device_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.animation,
  });

  final String title;
  final String subTitle;
  final String animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .only(
          right: AppSizes.defaultSpace,
          left: AppSizes.defaultSpace,
          top: AppDeviceHelper.getAppBarHeight(),
        ),
        child: Column(
          children: [
            Text(
              title,
              textAlign: .center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: AppSizes.spaceBtwItems),

            Text(
              subTitle,
              textAlign: .center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Lottie.asset(animation),
          ],
        ),
      ),
    );
  }
}
