import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/exports.dart';

class DFormDivider extends StatelessWidget {
  const DFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? ColorRes.darkerGrey : ColorRes.grey, thickness: 0.5, indent: 20, endIndent: 5,)),
        Text(dividerText.toUpperCase(), style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? ColorRes.darkerGrey : ColorRes.grey, thickness: 0.5, indent:20, endIndent: 5,)),
      ],
    );
  }
}
