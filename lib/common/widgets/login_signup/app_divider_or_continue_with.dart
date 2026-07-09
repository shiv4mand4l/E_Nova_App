import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';

class AppDividerOrContinueWith extends StatelessWidget {
  const AppDividerOrContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(indent: 3, endIndent: 20)),
        Text(AppText.orContinueWith),
        Expanded(child: Divider(indent: 20, endIndent: 3)),
      ],
    );
  }
}
