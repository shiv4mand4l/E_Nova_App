import 'package:e_nova/utlis/helpers/app_device_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothDotIndicator extends StatelessWidget {
  const SmoothDotIndicator({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppDeviceHelper.getBottonNavBarHeight(),
      left: MediaQuery.sizeOf(context).width / 2.5,
      // right: MediaQuery.sizeOf(context).width / 2.5,
      child: SmoothPageIndicator(
        controller: pageController,
        count: 3,
        effect: ExpandingDotsEffect(dotHeight: 11),
      ),
    );
  }
}
